class Event < ApplicationRecord
  belongs_to :catagory
  has_many :tickets

  accepts_nested_attributes_for :tickets

  validates_presence_of :name
  validates_presence_of :number_of_tickets
  validates_presence_of :date
  validates_presence_of :creator
  validates_presence_of :catagory_id

  def availble_ticket_count
    @tickets = "#{Ticket.all.where(event_id: id, purchaser_id: nil).count}"
    if @tickets.to_i > 0
      return @tickets
    else
      "Sold Out!"
    end
  end

end
