class AddUserIdToDebats < ActiveRecord::Migration
  def change
    add_column :debats, :user_id, :integer
    add_index :debats, :user_id
  end
end
