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
    # binding.pry
    @tickets = ticket_params
    if @tickets[:ticket_no_for_purchase].to_i > 0
      @ticket_array = Ticket.all.where(event_id: @tickets[:event_id].to_i, purchaser_id: nil)
      @ticket_array = @ticket_array.limit(@tickets[:ticket_no_for_purchase].to_i).pluck(:id, :number, :event_id, :price)

      @ticket_array.each do |ticket_purchaser_params|
        ticket = Ticket.find(ticket_purchaser_params(0))
        ticket.update_attributes(purchaser_id: @tickets[:purchaser_id].to_i)
      end
    end
  end

  private

    def ticket_params
      params.permit(:ticket_no_for_purchase, :event_id, :purchaser_id)
    end

end
