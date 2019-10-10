class TicketCreator
  def initialize(params)
    @params = params
    @ticket_number = rand(9999999999)
    @ticket_array = [*1..@params.number_of_tickets]
  end

  def create_event_tickets
    @ticket_array.each do 
      Ticket.new(number: @ticket_number + 1, event_id: @params.id, sold_originally: false, sold_on_marketplace: false, on_resell: false, price: @params.price, purchaser_id: '')
    end
  end

end