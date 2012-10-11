class RemoveColoumnFromUsers < ActiveRecord::Migration
  def up
  remove_column :users, :password_salt
  remove_column :users, :password_hash
  end

  def down
  end
end
