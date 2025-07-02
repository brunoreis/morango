module Types
  module Queries
    module NodeQuery
      extend ActiveSupport::Concern

      included do
        field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
          argument :id, GraphQL::Types::ID, required: true, description: "ID of the object."
        end
      end

      def node(id:)
        context.schema.object_from_id(id, context)
      end
    end
  end
end 