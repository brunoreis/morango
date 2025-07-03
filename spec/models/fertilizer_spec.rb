require 'rails_helper'

RSpec.describe Fertilizer, type: :model do
  describe '#ppms_for' do
    context 'when we have a fertilizer with 1.5% of N' do
      let(:fertilizer) { create(:fertilizer) }
      let(:nitrogen)   { create(:nutrient, :nitrogen) }
      let!(:nc)        { create(:nutritional_content, fertilizer: fertilizer, nutrient: nitrogen, percentage: 1.5) }

      it 'returns correct hash for a single nutritional content' do
        expect(fertilizer.ppms_for(1000, 100)).to eq({ 'N' => 1.5 })
      end
    end

    context 'when we have a fertilizer with 1.5% of N and 2.0% of K' do
      let(:fertilizer) { create(:fertilizer) }
      let(:nitrogen)   { create(:nutrient, :nitrogen) }
      let(:potassium)  { create(:nutrient, :potassium) }
      let!(:nc_n)      { create(:nutritional_content, fertilizer: fertilizer, nutrient: nitrogen, percentage: 1.5) }
      let!(:nc_k)      { create(:nutritional_content, fertilizer: fertilizer, nutrient: potassium, percentage: 2.0) }

      it 'returns correct hash for multiple nutritional contents' do
        expect(fertilizer.ppms_for(1000, 100)).to eq({ 'N' => 1.5, 'K' => 2.0 })
      end
    end
  end
end