FactoryBot.define do
  factory :remind do
    remind_at { Time.now }
    remind_item
  end
end
