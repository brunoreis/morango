module Types
  module Queries
    module TestFieldQuery
      extend ActiveSupport::Concern

      included do
        field :test_field, String, null: false, description: "An example field added by the generator"
      end

      def test_field
        "Hello World!"
      end
    end
  end
end 