# frozen_string_literal: true

class DisbursementQuery
  attr_reader :merchant_id

  def initialize(merchant_id = nil)
    @merchant_id = merchant_id
  end

  def call
    return relation unless merchant_id

    relation.where(orders: { merchant_id: merchant_id })
  end

  private

  def relation
    @relation ||= Disbursement.includes(order: :merchant)
  end
end
