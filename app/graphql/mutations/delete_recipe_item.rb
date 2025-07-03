module Mutations
  class DeleteRecipeItem < Mutations::BaseMutation
    argument :recipe_id, ID, required: true
    argument :fertilizer_id, ID, required: true

    field :success, Boolean, null: false
    field :recipe, Types::RecipeType, null: true

    def resolve(recipe_id:, fertilizer_id:)
      recipe_item = RecipeItem.find_by(recipe_id: recipe_id, fertilizer_id: fertilizer_id)
      if recipe_item
        recipe = recipe_item.recipe
        recipe_item.destroy
        { success: true, recipe: recipe }
      else
        { success: false, recipe: nil }
      end
    end
  end
end