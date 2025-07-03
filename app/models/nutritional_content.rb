class NutritionalContent < ApplicationRecord
  belongs_to :fertilizer
  belongs_to :nutrient

  # Calculates ppm (mg/L) for a given volume (liters) and fertilizer quantity (grams)
  def ppm_for(volume_liters, fertilizer_quantity_grams)
    grams_of_nutrient = fertilizer_quantity_grams.to_f * (percentage.to_f / 100.0)
    (grams_of_nutrient * 1000) / volume_liters
  end
end
