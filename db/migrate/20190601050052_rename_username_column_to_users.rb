class RenameUsernameColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :username, :name
  	rename_index :users, :username, :name
  end
end
