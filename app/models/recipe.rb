class Recipe < ApplicationRecord
  has_many :recipe_items

  # Returns a hash { 'N' => ppm, 'K' => ppm, ... } for 1000L solution
  def nutritional_contents(total_volume_liters = 1000)
    nutrients_ppm = Hash.new(0.0)
    recipe_items.includes(fertilizer: {nutritional_contents: :nutrient}).each do |item|
      item.fertilizer.ppms_for(total_volume_liters, item.quantity).each do |symbol, ppm|
        nutrients_ppm[symbol] += ppm
      end
    end
    nutrients_ppm
  end
end
