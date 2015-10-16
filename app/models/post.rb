class Post < ActiveRecord::Base
  validates_presence_of :user_name, :title, :content

  has_and_belongs_to_many :tags

end