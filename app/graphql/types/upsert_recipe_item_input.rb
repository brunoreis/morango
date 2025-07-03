module Types
  class UpsertRecipeItemInput < Types::BaseInputObject
    argument :recipe_id, ID, required: true
    argument :fertilizer_id, ID, required: true
    argument :quantity, Integer, required: true
  end
end
