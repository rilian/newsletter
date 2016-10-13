# frozen_string_literal: true
FactoryGirl.define do
  factory :manager do
    sequence(:email) { |n| "email-#{n}@example.com" }
    password '12345678'
  end
end
