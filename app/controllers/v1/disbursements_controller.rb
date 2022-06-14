# frozen_string_literal: true

module V1
  class DisbursementsController < ApplicationController
    def index
      @disbursements = DisbursementQuery.new(params[:merchant_id]).call
    end
  end
end
