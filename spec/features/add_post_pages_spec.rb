require 'rails_helper'

describe "the add a post process" do
  it "adds a new post" do
    visit posts_path
    click_link 'Write New Post'
    fill_in 'User name', :with => 'Alex'
    fill_in 'Title', :with => 'hi'
    fill_in 'Content', :with => 'woo'
    click_on 'Create Post'
    expect(page).to have_content "You did it!! Post posted!"
  end

  it "gives error when no title is entered" do
    visit new_post_path
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end
end