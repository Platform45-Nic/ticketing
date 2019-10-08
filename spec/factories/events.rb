FactoryBot.define do
  factory :event do
    name { "MyString" }
    number_of_tickets { 1 }
    date { "2019-10-08" }
    catagory { "MyString" }
    description { "MyText" }
    creator { "MyString" }
  end
end
