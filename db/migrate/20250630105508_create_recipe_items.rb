class CreateRecipeItems < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_items do |t|
      t.integer :quantity
      t.references :recipe, null: false, foreign_key: true
      t.references :fertilizer, null: false, foreign_key: true

      t.timestamps
    end
    add_index :recipe_items, [:recipe_id, :fertilizer_id], unique: true
  end
end
