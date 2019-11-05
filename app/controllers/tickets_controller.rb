class TicketsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @tickets = Ticket.where(purchaser_id: current_user.id)
    @event = Event.find(@tickets.first.event_id)
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
    @user = User.find(current_user.id)
    @tickets_to_purchase = ticket_params
    if @user.account.check_ticket_price_against_account?(ticket_price_total) && @tickets_to_purchase[:ticket_no_for_purchase].to_i > 0
      TicketPurchaser.new(@tickets_to_purchase).purchase_ticket
      redirect_to show_tickets_path(params[:id])
    elsif @tickets_to_purchase[:ticket_no_for_purchase].to_i == 0
      flash.now[:error] = "Please choose at least 1 ticket before Purchase."
      render 'edit'
    else
      flash.now[:error] = "Ticket cost exceeds account amount, please top up account."
      render 'edit'
    end
  end

  private

    def ticket_params
      params.permit(:ticket_no_for_purchase, :event_id, :purchaser_id)
    end

    def ticket_price_total
      ticket = ticket_params
      ticket[:ticket_no_for_purchase].to_i * Ticket.where(event_id: ticket[:event_id].to_i).first.price
    end

end
