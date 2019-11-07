class TicketPurchaser
  def initialize(params)
    @ticket = params
    @ticket_array = Ticket.all.where(event_id: @ticket[:event_id].to_i, sold_originally: false, purchaser_id: nil).limit(@ticket[:ticket_no_for_purchase].to_i)
  end
  
  def purchase_ticket
    @ticket_array.each do |ticket_purchase|
      Ticket.find(ticket_purchase.id).update!(sold_originally: true, purchaser_id: @ticket[:purchaser_id].to_i)
      # Do account transaction here:
      account_transaction(ticket_purchase.price)
    end
  end

  def account_transaction(ticket_price)
    Account.find_by(user_id: @ticket[:purchaser_id].to_i).subtract_from_account!(ticket_price)
    AccountTransaction.new(amount: ticket_price, account_id: Account.find_by(user_id: @ticket[:purchaser_id].to_i), note: "ticket purchase").save
  end

end