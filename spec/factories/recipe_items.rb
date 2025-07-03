FactoryBot.define do
  factory :recipe_item do
    association :recipe
    association :fertilizer
    quantity { 100 }
  end
end