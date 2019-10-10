class Event < ApplicationRecord
  belongs_to :catagory, class_name: 'Catagory'
  has_many :tickets

  accepts_nested_attributes_for :tickets
end
