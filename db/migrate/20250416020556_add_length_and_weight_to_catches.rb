class AddLengthAndWeightToCatches < ActiveRecord::Migration[8.0]
  def change
    add_column :catches, :length, :float
    add_column :catches, :weight, :float
  end
end
