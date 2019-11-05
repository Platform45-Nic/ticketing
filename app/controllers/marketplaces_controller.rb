class MarketplacesController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @ticket = Ticket.find(param[:id])
    # @catagory = Catagory.find(params[:id])
    # @catagory_events = Event.where(catagory_id: @catagory.id.to_i)
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

  private

    def catagory_params
      params.require(:catagory).permit(:name)
    end

end
