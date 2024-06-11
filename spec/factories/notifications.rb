FactoryBot.define do
  factory :notification do
    user { nil }
    notifiable { nil }
    message { "MyString" }
    read { false }
  end
end
