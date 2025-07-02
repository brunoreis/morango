class Fertilizer < ApplicationRecord
  belongs_to :brand, optional: true
  has_many :nutritional_contents
end
