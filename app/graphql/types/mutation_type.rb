# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_recipe, mutation: Mutations::CreateRecipe
    field :upsert_recipe_item, mutation: Mutations::UpsertRecipeItem
    field :delete_recipe_item, mutation: Mutations::DeleteRecipeItem
  end
end
