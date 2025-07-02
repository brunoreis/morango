class CreateFertilizers < ActiveRecord::Migration[7.1]
  def change
    create_table :fertilizers do |t|
      t.string :name
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
