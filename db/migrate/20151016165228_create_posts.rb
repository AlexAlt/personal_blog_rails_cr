class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :user_name, :string
      t.column :title, :string
      t.column :content, :string

      t.timestamps
    end
  end
end
