# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProcessOrderJob, type: :job do
  describe '#perform' do
    after { subject.perform }

    context 'when do not have order to process' do
      it { expect(GenerateDisbursementService).to_not receive(:new) }
    end

    context 'when have order to process' do
      let!(:order) { create(:order, :completed) }

      before { create_list(:order, 3) }

      it do
        expect(GenerateDisbursementService).to receive(:new).and_call_original.once
      end
    end
  end
end
