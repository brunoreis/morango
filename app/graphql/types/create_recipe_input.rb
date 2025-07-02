module Types
  class CreateRecipeInput < Types::BaseInputObject
    argument :name, String, required: true
    argument :items, [Types::CreateRecipeItemInput], required: false
  end
end 