require 'rails_helper'

describe "the delete a post process" do
  it "deletes a post" do
    new_post = Post.create({title: "Hi", user_name: "Alex", content: "Hi"})
    visit post_path(new_post)
    click_on 'Delete Post'
    expect(page).to have_content "Recent Posts"
  end

end