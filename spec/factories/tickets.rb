FactoryBot.define do
  factory :ticket do
    number { "MyString" }
    event { nil }
    sold_originally { false }
    sold_on_marketplace { false }
    on_resell { false }
    price { 1 }
  end
end
