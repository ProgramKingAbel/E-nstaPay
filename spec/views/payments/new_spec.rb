require 'rails_helper'

describe "Transactions", type: :system do
  include Devise::Test::IntegrationHelpers

  it "should create a new transaction" do
    user = User.create!(
      name: 'Abel Morara',
      email: 'abelmorara254@gmail.com',
      password: '123456',
      password_confirmation: '123456',
      confirmed_at: Time.now
    )

    group = Group.create(name: "Group 1",icon:"https://cdn-icons-png.flaticon.com/512/5977/5977588.png", user:user)
            
    sign_in user
    visit new_group_payment_path(group)
         

    fill_in "payment_name", with: "New Transaction"
    fill_in "payment_amount", with: 25.00
    find("input[type='checkbox']").check

    click_button "Create Transaction"

    expect(page).to have_content("New Transaction")
    expect(page).to have_content("$25.00")

    find(".arrow").click
    expect(page).to have_content("Payments for #{group.name}")
    expect(page).to have_link("Add a New Group", href: new_group_path)
  end
end
