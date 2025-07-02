module Types
  class NutrientType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :chemical_symbol, String, null: false
    field :macronutrient, Boolean, null: true
  end
end 