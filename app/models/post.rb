class Post < ActiveRecord::Base
  validates_presence_of :user_name, :title, :content

  has_and_belongs_to_many :tags

  default_scope {order('created_at DESC')}
end