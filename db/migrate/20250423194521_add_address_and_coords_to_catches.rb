class AddAddressAndCoordsToCatches < ActiveRecord::Migration[8.0]
  def change
    add_column :catches, :address, :string
    add_column :catches, :latitude, :float
    add_column :catches, :longitude, :float
  end
end
