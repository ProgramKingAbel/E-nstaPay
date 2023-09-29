require 'rails_helper'

describe 'Payments', type: :system do
  include Devise::Test::IntegrationHelpers

  it 'Allows User to view the list Payments per Category' do
    user = User.create!(
      name: 'Abel Morara',
      email: 'abelmorara254@gmail.com',
      password: '123456',
      password_confirmation: '123456',
      confirmed_at: Time.now
    )

    group1 = Group.create(name: 'Group 1', icon: 'https://cdn-icons-png.flaticon.com/512/5977/5977588.png', user:)

    Payment.create(name: 'Payment 1', amount: 10.50, user:, groups: [group1])
    Payment.create(name: 'Payment 2', amount: 15.75, user:, groups: [group1])
    Payment.create(name: 'Payment 3', amount: 5.25, user:, groups: [group1])

    sign_in user
    visit group_payments_path(group1)

    expect(page).to have_content('TRANSACTIONS')
    expect(page).to have_content("Payments for #{group1.name}")
    expect(page).to have_content('Total Amount: $31.50')

    expect(page).to have_content('Payment 1')
    expect(page).to have_content('$10.50')
    expect(page).to have_content('Payment 2')
    expect(page).to have_content('$15.75')

    expect(page).to have_link('Add a New Transaction', href: new_group_payment_path(group1))
  end
end
