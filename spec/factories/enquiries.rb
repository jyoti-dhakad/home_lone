FactoryBot.define do
  factory :enquiry do
    message {"i have one enquiry"}
    association :user
    association :loan_application
    
  end
end
