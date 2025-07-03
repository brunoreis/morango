FactoryBot.define do
  factory :nutrient do
    name { "Nitrogen" }
    chemical_symbol { "N" }

    trait :phosphorus do
      name { "Phosphorus" }
      chemical_symbol { "P" }
    end

    trait :potassium do
      name { "Potassium" }
      chemical_symbol { "K" }
    end

    trait :calcium do
      name { "Calcium" }
      chemical_symbol { "Ca" }
    end

    trait :magnesium do
      name { "Magnesium" }
      chemical_symbol { "Mg" }
    end

    trait :sulfur do
      name { "Sulfur" }
      chemical_symbol { "S" }
    end

    trait :iron do
      name { "Iron" }
      chemical_symbol { "Fe" }
    end

    trait :manganese do
      name { "Manganese" }
      chemical_symbol { "Mn" }
    end

    trait :boron do
      name { "Boron" }
      chemical_symbol { "B" }
    end

    trait :copper do
      name { "Copper" }
      chemical_symbol { "Cu" }
    end

    trait :zinc do
      name { "Zinc" }
      chemical_symbol { "Zn" }
    end

    trait :molybdenum do
      name { "Molybdenum" }
      chemical_symbol { "Mo" }
    end

    trait :nitrogen do
      name { "Nitrogen" }
      chemical_symbol { "N" }
    end
  end
end