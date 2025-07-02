module Types
  class FertilizersFilterInput < Types::BaseInputObject
    argument :name, String, required: false, description: "Nome do fertilizante para busca."
  end
end 