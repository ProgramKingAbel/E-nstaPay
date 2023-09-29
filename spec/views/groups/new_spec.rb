require 'rails_helper'

describe "Groups", type: :system do
  include Devise::Test::IntegrationHelpers

  it "Allows User create a new category/group" do
    user = User.create!(
      name: 'Abel Morara',
      email: 'abelmorara254@gmail.com',
      password: '123456',
      password_confirmation: '123456',
      confirmed_at: Time.now
    )

    sign_in user
    visit new_group_path

    fill_in "group_name", with: "New Category Name"
    fill_in "group_icon", with: "https://cdn-icons-png.flaticon.com/512/5977/5977588.png"

    click_button "Create Category"

    expect(page).to have_content("New Category Name")

  end
end