class CreateNutritionalContents < ActiveRecord::Migration[7.1]
  def change
    create_table :nutritional_contents do |t|
      t.float :percentage
      t.references :fertilizer, null: false, foreign_key: true
      t.references :nutrient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
