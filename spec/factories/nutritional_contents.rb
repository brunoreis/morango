FactoryBot.define do
  factory :nutritional_content do
    percentage { 1.5 }
    association :fertilizer
    association :nutrient
  end
end