class AddMacronutrientToNutrients < ActiveRecord::Migration[7.1]
  def change
    add_column :nutrients, :macronutrient, :boolean
  end
end
