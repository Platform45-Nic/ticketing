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
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(ticket_params)
      flash[:success] = "You have updated a ticket"
      redirect_to @ticket
    else
      render 'edit'
    end
  end

  private

    def ticket_params
      params.permit(:ticket_no_for_purchase, :event_id, :purchaser_id)
    end

end
