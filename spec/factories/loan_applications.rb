FactoryBot.define do
  factory :loan_application do
    amount {200000}
    year {3}
    application_number {"123sd34"}
    association :user
    
  end
end
