class AddUserIdToCatches < ActiveRecord::Migration[8.0]
  def change
    add_column :catches, :user_id, :integer
    add_index :catches, :user_id
  end
end
