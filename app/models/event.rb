class Event < ApplicationRecord
  belongs_to :catagory, class_name: 'Catagory'
  has_many :tickets

  accepts_nested_attributes_for :tickets

  def availble_ticket_count
    "#{Ticket.all.where(event_id: id, purchaser_id: nil).count}"
  end
end
