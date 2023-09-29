require 'rails_helper'

RSpec.describe Payment, type: :model do
  it 'is valid with a user, name, and non-negative amount' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    payment = Payment.new(user:, name: 'Test Payment', amount: 10.50)
    expect(payment).to be_valid
  end

  it 'is invalid without a user' do
    payment = Payment.new(name: 'Test Payment', amount: 10.50)
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
    payment = Payment.new(user:, name: 'Test Payment', amount: 0.00)
    expect(payment).to be_valid
  end
end
