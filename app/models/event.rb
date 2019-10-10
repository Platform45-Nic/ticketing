class Event < ApplicationRecord
  belongs_to :catagory, class_name: 'Catagory'
end
