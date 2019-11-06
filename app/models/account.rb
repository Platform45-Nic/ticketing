class Account < ApplicationRecord
  belongs_to :user
  has_many :account_transactions

  validates_presence_of :user_id
  validates_presence_of :amount

  def check_ticket_price_against_account?(ticket_price_total)
    if ticket_price_total <= self.amount
      true
    else
      false
    end
  end

  def subtract_from_account!(amount_total)
    if amount_total <= self.amount
      self.update_attributes(amount: (amount - amount_total))
    end
  end

  def add_to_account!(amount_total)
    self.update_attributes(amount: (amount + amount_total))
  end

end
