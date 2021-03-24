class UpdateUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string, unique: true
    add_column :users, :admin, :boolean, default: false
  end
end
