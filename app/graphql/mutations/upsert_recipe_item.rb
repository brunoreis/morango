module Mutations
  class UpsertRecipeItem < Mutations::BaseMutation
    argument :input, Types::UpsertRecipeItemInput, required: true

    field :recipe_item, Types::RecipeItemType, null: false
    field :recipe, Types::RecipeType, null: false

    def resolve(input:)
      attrs = input.to_h
      recipe_item = RecipeItem.find_or_initialize_by(
        recipe_id: attrs[:recipe_id],
        fertilizer_id: attrs[:fertilizer_id]
      )
      recipe_item.quantity = attrs[:quantity]
      recipe_item.save!

      {
        recipe_item: recipe_item,
        recipe: recipe_item.recipe
      }
    end
  end
end