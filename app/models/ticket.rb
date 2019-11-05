class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :purchaser, class_name: 'User', optional: true

  scope :marketplace, -> { where(on_resell: true) }
  scope :owned, -> { where(on_resell: false) }

  def ticket_count
    self.count
  end

end
