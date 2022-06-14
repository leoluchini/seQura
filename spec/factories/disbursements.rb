# frozen_string_literal: true

FactoryBot.define do
  factory :disbursement do
    amount { 1.425 }
    association :order, factory: [:order, :completed]
  end
end
