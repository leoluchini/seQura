# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::Disbursements', type: :request do
  describe 'GET /index' do
    let!(:merchant) { create(:merchant) }
    let!(:order) { create(:order, :completed, merchant: merchant) }
    let!(:disbursement) { create(:disbursement, order: order) }
    let!(:other_disbursement) { create(:disbursement) }

    before do
      get '/v1/disbursements', params: params
    end

    context 'when the params is not present' do
      let(:params) { {} }
      let(:json_response) do
        {
          collection: [
            {
              id: disbursement.id,
              amount: disbursement.amount,
              merchant: {
                name: merchant.name,
                email: merchant.email,
                cif: merchant.cif
              },
              order: {
                amount: order.amount,
                completed_at: order.completed_at
              }
            }, {
              id: other_disbursement.id,
              amount: other_disbursement.amount,
              merchant: {
                name: other_disbursement.merchant.name,
                email: other_disbursement.merchant.email,
                cif: other_disbursement.merchant.cif
              },
              order: {
                amount: other_disbursement.order.amount,
                completed_at: other_disbursement.order.completed_at
              }
            }
          ]
        }.to_json
      end

      it 'returns all the disbursements' do
        expect(response).to be_successful
        expect(response.body).to be_json_eql(json_response)
      end
    end

    context 'when the params is present' do
      let(:params) { { merchant_id: merchant.id } }
      let(:json_response) do
        {
          collection: [
            {
              id: disbursement.id,
              amount: disbursement.amount,
              merchant: {
                name: merchant.name,
                email: merchant.email,
                cif: merchant.cif
              },
              order: {
                amount: order.amount,
                completed_at: order.completed_at
              }
            }
          ]
        }.to_json
      end

      it 'returns all the disbursements' do
        expect(response).to be_successful
        expect(response.body).to be_json_eql(json_response)
      end
    end
  end
end
