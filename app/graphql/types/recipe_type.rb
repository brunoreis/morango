module Types
  class RecipeType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :recipe_items, [Types::RecipeItemType], null: false
  end
end 