class CreateCatches < ActiveRecord::Migration[8.0]
  def change
    create_table :catches do |t|
      t.string :species
      t.string :bait
      t.string :weather
      t.datetime :date
      t.string :notes

      t.timestamps
    end
  end
end
