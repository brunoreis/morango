class ChangeBrandToOptionalInFertilizers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :fertilizers, :brand_id, true
  end
end
