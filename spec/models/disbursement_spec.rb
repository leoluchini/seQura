# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:order) }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:merchant).to(:order) }
  end

  describe 'validations' do
    subject { disbursement.validate! }

    context 'the order must be completed' do
      let(:disbursement) { build(:disbursement, order: build(:order)) }

      it 'raises an error' do
        validation_error_message =
          I18n.t('activerecord.errors.models.disbursement.attributes.' \
                 '.base.only_order_completed')
        expect { subject }.to raise_error(
          ActiveRecord::RecordInvalid,
          "Validation failed: #{validation_error_message}"
        )
      end
    end
  end
end
