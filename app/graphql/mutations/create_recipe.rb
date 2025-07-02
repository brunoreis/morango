module Mutations
  class CreateRecipe < GraphQL::Schema::Mutation
    argument :input, Types::CreateRecipeInput, required: true
    type Types::RecipeType

    def resolve(input:)
      recipe = Recipe.create!(name: input[:name])
      if input[:items]
        input[:items].each do |item|
          recipe.recipe_items.create!(
            fertilizer_id: item[:fertilizer_id],
            quantity: item[:quantity]
          )
        end
      end
      recipe
    end
  end
end