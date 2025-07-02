module Types
  class FertilizerType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :brand, Types::BrandType, null: true
    field :nutritional_contents, [Types::NutritionalContentType], null: false
    field :solubility, Float, null: true
  end
end 