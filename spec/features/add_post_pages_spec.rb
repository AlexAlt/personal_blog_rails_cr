require 'rails_helper'

describe "the add a post process" do
   before :each do
    admin = User.new({username: "Alex", admin: true, password: "password"})
    admin.save
    visit '/'
    click_on "Log In"
    fill_in 'Username', :with => "Alex"
    fill_in 'Password', :with => "password"
    within("#log-in") do
      click_on("Log In")
    end
  end

  it 'only allows admins access to the new post form' do
    expect(page).to have_content "Write New Post"
  end

  it "adds a new post" do
    visit "/"
    click_link 'Write New Post'
    fill_in 'Title', :with => 'hi'
    fill_in 'Content', :with => 'woo'
    fill_in 'Name', :with => 'tag'
    click_on 'Create Post'
    expect(page).to have_content "You did it!! Post posted!"
  end

  it "gives error when no title is entered" do
    visit "/"
    click_link 'Write New Post'
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end
end