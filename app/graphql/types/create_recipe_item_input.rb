module Types
  class CreateRecipeItemInput < Types::BaseInputObject
    argument :fertilizer_id, ID, required: true
    argument :quantity, Integer, required: true
  end
end 