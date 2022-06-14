# frozen_string_literal: true

require 'rails_helper'

describe DisbursementQuery do
  let!(:merchant) { create(:merchant) }
  let!(:order) { create(:order, :completed, merchant: merchant) }
  let!(:disbursement) { create(:disbursement, order: order) }

  subject { described_class.new(merchant_id).call }

  before do
    create_list(:disbursement, 5)
  end

  describe '#call' do
    context 'when merchant_id is not provided' do
      let(:merchant_id) { nil }

      it 'returns all the data' do
        expect(subject.count).to eq(6)
      end
    end

    context 'when merchant_id is provided' do
      let(:merchant_id) { merchant.id }

      it 'returns all the data belong to merchant' do
        expect(subject.count).to eq(1)
        expect(subject.first.id).to eq(disbursement.id)
      end
    end
  end
end
