require 'rails_helper'

describe Post do 
  it {should validate_presence_of :title }
  it {should validate_presence_of :content }

  it {should have_and_belong_to_many :tags}

  it {should have_many :comments}
  it {should belong_to :user}

  describe 'default scope' do
  it 'orders by descending name' do
    post_one = Post.create(title: "First Post!", content: "This is my first post!")
    post_two = Post.create(title: "Second Post!", content: "This is my second post!")
    expect(Post.all).to eq [post_two, post_one]
  end
end
  
end