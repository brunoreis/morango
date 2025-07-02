class MakePercentageNotNullInNutritionalContents < ActiveRecord::Migration[7.1]
  def change
    change_column_null :nutritional_contents, :percentage, false
  end
end 