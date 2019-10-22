class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[:success] = "You have created a ticket"
      redirect_to @ticket
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    @user = User.find(current_user.id)
    @available_tickets = @event.availble_ticket_count
  end

  def update
    @tickets_to_purchase = ticket_params
    # Check if there is enough for the transaction:
    if Account.find_by(user_id: User.find(current_user.id).id).check_ticket_price_against_account?(ticket_price_total(@tickets_to_purchase, Ticket.where(event_id: @tickets_to_purchase[:event_id].to_i).first)) == true
      # Check the ticket counter is not 0 before purchase:
      if @tickets_to_purchase[:ticket_no_for_purchase].to_i > 0
        @ticket_array = Ticket.all.where(event_id: @tickets_to_purchase[:event_id].to_i, sold_originally: false, purchaser_id: nil)
        @ticket_array = @ticket_array.limit(@tickets_to_purchase[:ticket_no_for_purchase].to_i).pluck(:id, :event_id, :price)
        # Start transaction on user account/transaction:
        @ticket_array.each do |ticket_purchase|
          ticket = Ticket.find(ticket_purchase(0))
          ticket.update(sold_originally: true, purchaser_id: @tickets_to_purchase[:purchaser_id].to_i)
          # Do account transaction here
          account_transaction(ticket.price)
        end
        redirect_to normals_profile_path
      else
        flash.now[:error] = "Please choose more than 0 tickets."
        render 'edit'
      end
    else
      flash.now[:error] = "Ticket cost exceeds account amount, please top up account."
      render 'edit'
    end
  end

  private

    def ticket_params
      params.permit(:ticket_no_for_purchase, :event_id, :purchaser_id)
    end

    def ticket_price_total(ticket_params, ticket)
      ticket_params[:ticket_no_for_purchase].to_i * ticket.price
    end

    def account_transaction(ticket_price)
      Account.find_by(user_id: User.find(current_user.id).id).subtract_from_account!(ticket_price)
      AccountTransaction.new(amount: ticket_price, account_id: Account.find_by(user_id: User.find(current_user.id).id), note: "ticket purchase").save
    end

end
