class MarketplacesController < ApplicationController

  def index
    @events = Event.all.future
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @catagory = Catagory.new
  end

  def create
    @catagory = Catagory.new(catagory_params)
    if @catagory.save
      flash[:success] = "You have Created a new Catagory"
      redirect_to @catagory, notice: "You have Created a new Catagory"
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(on_resell: true)
    if @ticket.save
      flash[:success] = "Ticket now for sale on the Marketplace."
      redirect_to user_tickets_path
    else
      flash.now[:error] = "There was a problem moving your ticket to the Marketplace."
      redirect_to user_tickets_path
    end
  end

  private

    def catagory_params
      params.require(:catagory).permit(:name)
    end

end
