class Account < ApplicationRecord
  belongs_to :user
  has_many :account_transactions

  validates_presence_of :user_id
end
