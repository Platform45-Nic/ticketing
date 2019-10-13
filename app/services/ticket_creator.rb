class TicketCreator
  def initialize(params, event)
    @params = params
    @price = params[:tickets_attributes].fetch('0')[:price].to_i
    @ticket_number = rand(9999999999)
    @ticket_array = [*1..@params[:number_of_tickets].to_i]
    @event_id = event.id
  end

  def create_event_tickets
    @ticket_array.each do |n|
      Ticket.new(number: (@ticket_number = (@ticket_number + 1)).to_s, event_id: @event_id, sold_originally: false, sold_on_marketplace: false, on_resell: false, price: @price, purchaser_id: '').save
    end
  end

end