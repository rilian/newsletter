FactoryGirl.define do
  factory :link do
    sequence(:url) { |n| "test-#{n}@example.com" }
  end
end
