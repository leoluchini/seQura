# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper

  def completed?
    completed_at.present?
  end
end
