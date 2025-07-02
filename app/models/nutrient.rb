class Nutrient < ApplicationRecord
  has_many :nutritional_contents
  # macronutrient: boolean
end
