# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include Types::Queries::NodeQuery
    include Types::Queries::NodesQuery
    include Types::Queries::TestFieldQuery
    include Types::Queries::NutrientsQuery
    include Types::Queries::FertilizersQuery
    include Types::Queries::RecipesQuery

    field :recipe, Types::RecipeType, null: true do
      argument :id, ID, required: true
    end

    def recipe(id:)
      Recipe.find_by(id: id)
    end
  end
end
