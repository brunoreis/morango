module Types
  module Queries
    module FertilizersQuery
      extend ActiveSupport::Concern

      included do
        field :fertilizers, [Types::FertilizerType], null: false, description: "Lista todos os fertilizantes com composição e nutrientes" do
          argument :input, Types::FertilizersInput, required: false
        end
      end

      def fertilizers(input: nil)
        scope = Fertilizer.all
        if input&.filter&.name.present?
          scope = scope.where("name LIKE ?", "%#{input.filter.name}%")
        end
        scope
      end
    end
  end
end 