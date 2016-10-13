# frozen_string_literal: true
FactoryGirl.define do
  factory :subscriber do
    sequence(:email) { |n| "email-#{n}@example.com" }
  end
end
