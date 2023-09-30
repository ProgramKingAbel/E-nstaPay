require 'rails_helper'

RSpec.describe Payment, type: :model do
  it 'is valid with a user, name, and non-negative amount' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    group = Group.create(name: 'Group 1', icon: 'https://cdn-icons-png.flaticon.com/512/5977/5977588.png', user:)
    payment = Payment.new(user:, name: 'Test Payment', amount: 10.50, groups: [group])
    expect(payment).to be_valid
  end

  it 'is invalid without a user' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    group = Group.create(name: 'Group 1', icon: 'https://cdn-icons-png.flaticon.com/512/5977/5977588.png', user:)
    payment = Payment.new(name: 'Test Payment', amount: 10.50, groups: [group])
    expect(payment).not_to be_valid
  end

  it 'is invalid without a name' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    payment = Payment.new(user:, amount: 10.50)
    expect(payment).not_to be_valid
  end

  it 'is invalid with a negative amount' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    payment = Payment.new(user:, name: 'Test Payment', amount: -10.50)
    expect(payment).not_to be_valid
  end

  it 'is valid with a zero amount' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    group = Group.create(name: 'Group 1', icon: 'https://cdn-icons-png.flaticon.com/512/5977/5977588.png', user:)
    payment = Payment.new(user:, name: 'Test Payment', amount: 0.00, groups: [group])
    expect(payment).to be_valid
  end
end
