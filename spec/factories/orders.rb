# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    amount { 500 }
    association :merchant
    association :shopper

    trait :completed do
      completed_at { Time.current }
    end
  end
end
