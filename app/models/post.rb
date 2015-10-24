class Post < ActiveRecord::Base
  validates_presence_of :title, :content

  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags, allow_destroy: true
  has_many :comments
  belongs_to :user

  default_scope {order('created_at DESC')}

  before_save :get_tags


  def get_tags
    self.tags = self.tags.collect do |tag|
      Tag.find_or_create_by(name: tag.name)
    end
  end
end