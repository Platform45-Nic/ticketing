FactoryBot.define do
  factory :account_transaction do
    amount { 1 }
    account { nil }
    note { "MyString" }
  end
end
