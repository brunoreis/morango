module Types
  class RecipeItemType < Types::BaseObject
    field :id, ID, null: false
    field :quantity, Integer, null: false
    field :fertilizer, Types::FertilizerType, null: false
    field :recipe, Types::RecipeType, null: false
  end
end 