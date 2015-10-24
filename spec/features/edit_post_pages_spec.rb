require 'rails_helper'

describe "the edit a post process" do
    before :each do
    @admin = User.new({username: "Alex", admin: true, password: "password"})
    @admin.save
    visit '/'
    click_on "Log In"
    fill_in 'Username', :with => "Alex"
    fill_in 'Password', :with => "password"
    within("#log-in") do
      click_on("Log In")
    end
  end

  it "edits a post" do
    new_post = Post.create({title: "Hi", content: "Hi", user_id: @admin.id})
    visit edit_user_post_path(@admin, new_post)
    fill_in 'Title', :with => 'Hello'
    click_on 'Update Post'
    expect(page).to have_content "Success!"
  end

end