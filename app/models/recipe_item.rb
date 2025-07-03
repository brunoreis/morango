class RecipeItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :fertilizer

  validates :fertilizer_id, uniqueness: { scope: :recipe_id }
end
