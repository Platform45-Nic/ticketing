class Event < ApplicationRecord
  belongs_to :catagory
  has_many :tickets

  accepts_nested_attributes_for :tickets

  validates_presence_of :name
  validates_presence_of :number_of_tickets
  validates_presence_of :date
  validate :date_availability
  validates_presence_of :creator
  validates_presence_of :catagory_id

  scope :future, -> { where("date >= ?", Date.current) }
  scope :past, -> { where("date < ?", Date.current) }

  def availble_ticket_count
    @tickets = "#{Ticket.all.where(event_id: id, purchaser_id: nil).count}"
    if @tickets.to_i > 0
      return @tickets
    else
      "Sold Out!"
    end
  end

  def tickets_for_marketplace
    self.tickets.marketplace
  end

  private

  def date_availability
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

end
