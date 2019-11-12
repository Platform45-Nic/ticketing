FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "fnametest#{n}" }
    sequence(:last_name) { |n| "lnametest#{n}" }
    sequence(:email) { |n| "test#{n}@test.com" }
    sequence(:type) { |t = ["Admin", "Normal"].sample| "#{t}" }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
