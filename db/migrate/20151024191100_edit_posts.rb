class EditPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :user_name, :string
  end
end
