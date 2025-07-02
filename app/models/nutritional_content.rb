class NutritionalContent < ApplicationRecord
  belongs_to :fertilizer
  belongs_to :nutrient
end
