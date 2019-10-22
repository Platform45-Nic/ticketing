class AccountTransaction < ApplicationRecord
  belongs_to :account

  validates_presence_of :amount
  validates_presence_of :account_id
  validates_presence_of :note
  
end
