module Types
  module Queries
    module NutrientsQuery
      extend ActiveSupport::Concern

      included do
        field :nutrients, [Types::NutrientType], null: false, description: "Lista todos os nutrientes"
      end

      def nutrients
        Nutrient.all
      end
    end
  end
end 