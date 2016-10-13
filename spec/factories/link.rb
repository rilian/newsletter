# frozen_string_literal: true
FactoryGirl.define do
  factory :link do
    sequence(:url) { |n| "test-#{n}@example.com" }
    desc ''
  end
end
