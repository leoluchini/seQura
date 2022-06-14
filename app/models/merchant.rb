# frozen_string_literal: true

class Merchant < ApplicationRecord
  has_many :orders

  validates :name, presence: true
  validates :email, uniqueness: true
end
