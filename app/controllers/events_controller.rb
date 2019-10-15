class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @event.tickets.new
  end

  def create
    @ticket_params = ticket_params
    @event = Event.new(event_params)
    if @event.save
      TicketCreator.new(@ticket_params, @event).create_event_tickets
      flash[:success] = "You have created a event"
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "You have updated a event"
      redirect_to @event
    else
      render 'edit'
    end
  end

  private

    def event_params
      params.require(:event).permit(:name, :number_of_tickets, :date, :catagory_id, :description, :creator)
    end

    def ticket_params
      params.require(:event).permit(:number_of_tickets, tickets_attributes: [:price])
    end

end
