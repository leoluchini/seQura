# frozen_string_literal: true

class ProcessOrderJob < ApplicationJob
  queue_as :default

  def perform
    Order.where(completed_at: 1.week.ago..Time.current).each do |order|
      GenerateDisbursementService.new(order).call
    end
  end
end
