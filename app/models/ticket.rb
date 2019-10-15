class Ticket < ApplicationRecord
  belongs_to :event, class_name: 'Event'
  belongs_to :purchaser, class_name: 'User', optional: true
end
