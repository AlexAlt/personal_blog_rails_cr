require 'rails_helper'

describe "the delete a post process" do
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

  it "deletes a post" do
    new_post = Post.create({title: "Hi", content: "Hi", user_id: @admin.id})
    visit user_post_path(@admin, new_post)
     within(".btn-link") do
      click_on("Delete Post")
    end
    expect(page).to have_content "Log Out"
  end

end