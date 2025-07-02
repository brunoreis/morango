module Types
  class FertilizersInput < Types::BaseInputObject
    argument :filter, Types::FertilizersFilterInput, required: false, description: "Filtro para busca de fertilizantes. Exemplo: { name: 'MAP' }"
  end
end 