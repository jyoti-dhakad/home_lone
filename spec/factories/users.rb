FactoryBot.define do
  factory :user do
    
    password { "123123" }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    present_address { Faker::Address.full_address }
    parmanent_address { Faker::Address.full_address }
    category { %w[OBC ST SC General].sample }
    annual_income { Faker::Number.between(from: 20_000, to: 100_000) }
    
    phone_number { Faker::PhoneNumber.phone_number }
    merital_status { %w[MARRIED SINGLE].sample }

  end
end