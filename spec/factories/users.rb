FactoryBot.define do
  factory :user do
    name {"test1"}
    email {"test1@example.com"}
    password {"password"}
    password_confirmation {"password"}
  end
end
