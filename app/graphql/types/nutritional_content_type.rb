module Types
  class NutritionalContentType < Types::BaseObject
    field :id, ID, null: false
    field :percentage, Float, null: false
    field :nutrient, Types::NutrientType, null: false
  end
end 