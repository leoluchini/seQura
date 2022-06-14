# frozen_string_literal: true

require 'rails_helper'

describe GenerateDisbursementService do
  describe '#call' do
    subject { described_class.new(order).call }

    context 'when the order is not completed' do
      let(:order) { create(:order) }

      it { is_expected.to be_nil }
    end

    context 'when the order is completed' do
      let(:order) { create(:order, :completed, amount: amount) }

      context 'and the price is lower than 50' do
        let(:amount) { 45.0 }

        it do
          expect { subject }.to change(Disbursement, :count).from(0).to(1)
          expect(Disbursement.first.amount).to eq(0.45)
        end
      end

      context 'and the price is between 50 and 300' do
        let(:amount) { 150.0 }

        it do
          expect { subject }.to change(Disbursement, :count).from(0).to(1)
          expect(Disbursement.first.amount).to eq(1.425)
        end
      end

      context 'and the price is higher than 300' do
        let(:amount) { 500.0 }

        it do
          expect { subject }.to change(Disbursement, :count).from(0).to(1)
          expect(Disbursement.first.amount).to eq(4.25)
        end
      end
    end
  end
end
