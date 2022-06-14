# frozen_string_literal: true

class Shopper < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
end
