require 'rails_helper'

RSpec.describe NutritionalContent, type: :model do
  describe '#ppm_for' do
    it 'returns 1.5 for 1000 liters and 100 grams fertilizer' do
      nc = NutritionalContent.new(percentage: 1.5)
      # 100g fertilizer, 1.5% N => 1.5g N
      # ppm = (1.5g * 1000 / 1000L) = 1.5 ppm
      expect(nc.ppm_for(1000, 100)).to be_within(0.001).of(1.5)
    end

    it 'returns 6.0 for 500 liters and 200 grams fertilizer' do
      nc = NutritionalContent.new(percentage: 1.5)
      # 200g fertilizer, 1.5% K => 3g K
      # ppm = (3g * 1000 / 500L) = 6.0 ppm
      expect(nc.ppm_for(500, 200)).to be_within(0.001).of(6.0)
    end

    it 'returns 0 for 0 grams fertilizer' do
      nc = NutritionalContent.new(percentage: 10.0)
      expect(nc.ppm_for(1000, 0)).to eq(0)
    end

    it 'returns 0 or NaN/Infinity for 0 liters volume (avoid division by zero)' do
      nc = NutritionalContent.new(percentage: 5.0)
      result = nc.ppm_for(0, 100)
      expect(result.infinite?).to be_truthy.or be_nan
    end
  end
end