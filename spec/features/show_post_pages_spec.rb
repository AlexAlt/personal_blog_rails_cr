require 'rails_helper'

describe "the show a post process" do
  it "shows an individual post" do
    new_post = Post.create({title: "Hi", content: "Hi"})
    visit user_posts_path
    click_link 'Hi'
    expect(page).to have_content "Hi"
  end
end