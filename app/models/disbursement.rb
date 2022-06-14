# frozen_string_literal: true

class Disbursement < ApplicationRecord
  belongs_to :order

  delegate :merchant, to: :order

  validate :order_completed, if: :order

  private

  def order_completed
    return if order.completed?

    errors.add :base, :only_order_completed
  end
end
