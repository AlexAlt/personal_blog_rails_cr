require 'rails_helper'

describe Post do 
  it {should validate_presence_of :title }
  it {should validate_presence_of :user_name }
  it {should validate_presence_of :content }

  it {should have_and_belong_to_many :tags}

  describe 'default scope' do
  it 'orders by descending name' do
    post_one = Post.create(title: "First Post!", user_name: "Me", content: "This is my first post!")
    post_two = Post.create(title: "Second Post!", user_name: "Me", content: "This is my second post!")
    expect(Post.all).to eq [post_two, post_one]
  end
end
  
end