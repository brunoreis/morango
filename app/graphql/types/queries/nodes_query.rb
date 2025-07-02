module Types
  module Queries
    module NodesQuery
      extend ActiveSupport::Concern

      included do
        field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
          argument :ids, [GraphQL::Types::ID], required: true, description: "IDs of the objects."
        end
      end

      def nodes(ids:)
        ids.map { |id| context.schema.object_from_id(id, context) }
      end
    end
  end
end 