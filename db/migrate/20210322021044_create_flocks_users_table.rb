class CreateFlocksUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :flocks, :users
    add_index :flocks_users, :flock_id
    add_index :flocks_users, :user_id
  end
end
