class AddSolubilityToFertilizers < ActiveRecord::Migration[7.1]
  def change
    add_column :fertilizers, :solubility, :float
  end
end
