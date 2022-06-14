# frozen_string_literal: true

class GenerateDisbursementService
  attr_accessor :order

  def initialize(order)
    @order = order
  end

  def call
    return unless order.completed_at

    process_fee!
  end

  private

  def process_fee!
    case order.amount
    when 0...50.0    then create_disbursement_with(0.01)
    when 50.1..300.0 then create_disbursement_with(0.0095)
    when 300.1..     then create_disbursement_with(0.0085)
    end
  end

  def create_disbursement_with(tax)
    Disbursement.create!(amount: order.amount * tax, order: order)
  end
end
