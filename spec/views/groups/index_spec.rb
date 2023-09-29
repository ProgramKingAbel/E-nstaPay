require 'rails_helper'

describe 'Groups', type: :system do
  include Devise::Test::IntegrationHelpers

  it 'Allows User to view the list of groups' do
    user = User.create!(
      name: 'Abel Morara',
      email: 'abelmorara254@gmail.com',
      password: '123456',
      password_confirmation: '123456',
      confirmed_at: Time.now
    )

    group1 = Group.create(name: 'Group 1', icon: 'https://cdn-icons-png.flaticon.com/512/5977/5977588.png', user:)
    group2 = Group.create(name: 'Group 2', icon: 'https://cdn-icons-png.flaticon.com/512/5977/5977588.png', user:)
    group3 = Group.create(name: 'Group 3', icon: 'https://cdn-icons-png.flaticon.com/512/5977/5977588.png', user:)

    Payment.create(name: 'Payment 1', amount: 10.50, user: group1.user)
    Payment.create(name: 'Payment 2', amount: 15.75, user: group2.user)
    Payment.create(name: 'Payment 3', amount: 5.25, user: group3.user)

    sign_in user
    visit groups_path

    expect(page).to have_content('CATEGORIES')
    expect(page).to have_link('Add a New Group', href: new_group_path)

    within('.category-list') do
      expect(page).to have_selector('li', count: 3)

      expect(page).to have_content('Group 1')
      expect(page).to have_content('Group 2')
      expect(page).to have_content('Group 3')

      expect(page).to have_content(group1.created_at.strftime('%d %b %Y'))
      expect(page).to have_content(group2.created_at.strftime('%d %b %Y'))
      expect(page).to have_content(group3.created_at.strftime('%d %b %Y'))

      click_link 'Group 1'
    end
  end
end
