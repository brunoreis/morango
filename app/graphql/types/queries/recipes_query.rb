module Types
  module Queries
    module RecipesQuery
      extend ActiveSupport::Concern

      included do
        field :recipes, [Types::RecipeType], null: false, description: "Lista todas as receitas"
      end

      def recipes
        Recipe.all
      end
    end
  end
end 