require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe '#nutritional_contents' do
    context 'when the recipe has one item with a fertilizer with 1.5% of N' do
      let(:recipe)     { create(:recipe) }
      let(:fertilizer) { create(:fertilizer) }
      let(:nitrogen)   { create(:nutrient, :nitrogen) }
      let!(:nc)        { create(:nutritional_content, fertilizer: fertilizer, nutrient: nitrogen, percentage: 1.5) }
      let!(:item)      { create(:recipe_item, recipe: recipe, fertilizer: fertilizer, quantity: 100) }

      it 'returns correct hash for a single nutritional content' do
        expect(recipe.nutritional_contents(1000)).to eq({ 'N' => 1.5 })
      end
    end

    context 'when the recipe has one item with a fertilizer with 1.5% of N and 2.0% of K' do
      let(:recipe)     { create(:recipe) }
      let(:fertilizer) { create(:fertilizer) }
      let(:nitrogen)   { create(:nutrient, :nitrogen) }
      let(:potassium)  { create(:nutrient, :potassium) }
      let!(:nc_n)      { create(:nutritional_content, fertilizer: fertilizer, nutrient: nitrogen, percentage: 1.5) }
      let!(:nc_k)      { create(:nutritional_content, fertilizer: fertilizer, nutrient: potassium, percentage: 2.0) }
      let!(:item)      { create(:recipe_item, recipe: recipe, fertilizer: fertilizer, quantity: 100) }

      it 'returns correct hash for multiple nutritional contents' do
        expect(recipe.nutritional_contents(1000)).to eq({ 'N' => 1.5, 'K' => 2.0 })
      end
    end

    context 'when the recipe has two items with different fertilizers' do
      let(:recipe)      { create(:recipe) }
      let(:fertilizer1) { create(:fertilizer) }
      let(:fertilizer2) { create(:fertilizer) }
      let(:nitrogen)    { create(:nutrient, :nitrogen) }
      let(:potassium)   { create(:nutrient, :potassium) }
      let!(:nc1)        { create(:nutritional_content, fertilizer: fertilizer1, nutrient: nitrogen, percentage: 1.0) }
      let!(:nc2)        { create(:nutritional_content, fertilizer: fertilizer2, nutrient: potassium, percentage: 2.0) }
      let!(:item1)      { create(:recipe_item, recipe: recipe, fertilizer: fertilizer1, quantity: 100) }
      let!(:item2)      { create(:recipe_item, recipe: recipe, fertilizer: fertilizer2, quantity: 200) }

      it 'returns correct hash for nutrients from multiple fertilizers' do
        # fertilizer1: 100g, 1% N => 1g N, ppm = 1.0
        # fertilizer2: 200g, 2% K => 4g K, ppm = 4.0
        expect(recipe.nutritional_contents(1000)).to eq({ 'N' => 1.0, 'K' => 4.0 })
      end
    end

    context 'when the recipe has two items with different fertilizers that share some nutrients' do
      let(:recipe)      { create(:recipe) }
      let(:fertilizer1) { create(:fertilizer) }
      let(:fertilizer2) { create(:fertilizer) }
      let(:nitrogen)    { create(:nutrient, :nitrogen) }
      let(:potassium)   { create(:nutrient, :potassium) }
      let!(:nc1_n)      { create(:nutritional_content, fertilizer: fertilizer1, nutrient: nitrogen, percentage: 1.0) }
      let!(:nc1_k)      { create(:nutritional_content, fertilizer: fertilizer1, nutrient: potassium, percentage: 2.0) }
      let!(:nc2_n)      { create(:nutritional_content, fertilizer: fertilizer2, nutrient: nitrogen, percentage: 3.0) }
      let!(:item1)      { create(:recipe_item, recipe: recipe, fertilizer: fertilizer1, quantity: 100) }
      let!(:item2)      { create(:recipe_item, recipe: recipe, fertilizer: fertilizer2, quantity: 200) }

      it 'returns correct hash summing shared nutrients' do
        # fertilizer1: 100g, 1% N => 1g N, ppm = 1.0; 2% K => 2g K, ppm = 2.0
        # fertilizer2: 200g, 3% N => 6g N, ppm = 6.0
        # N should be summed: 1.0 + 6.0 = 7.0
        expect(recipe.nutritional_contents(1000)).to eq({ 'N' => 7.0, 'K' => 2.0 })
      end
    end
  end
end