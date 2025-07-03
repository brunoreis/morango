class Fertilizer < ApplicationRecord
  belongs_to :brand, optional: true
  has_many :nutritional_contents

  # Returns a hash { 'N' => ppm, 'K' => ppm, ... } for the given volume and fertilizer quantity
  def ppms_for(volume_liters, fertilizer_quantity_grams)
    nutritional_contents.includes(:nutrient).each_with_object({}) do |nc, hash|
      hash[nc.nutrient.chemical_symbol] = nc.ppm_for(volume_liters, fertilizer_quantity_grams)
    end
  end
end
