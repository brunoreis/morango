class CreateNutrients < ActiveRecord::Migration[7.1]
  def change
    create_table :nutrients do |t|
      t.string :name
      t.string :chemical_symbol

      t.timestamps
    end
  end
end
