class UpdateUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email, :string
    add_column :users, :username, :string
  end
end
