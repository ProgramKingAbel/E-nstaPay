require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name" do
    user = User.new(name: "John Doe", email: "john@example.com", password: "password")
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(email: "john@example.com", password: "password")
    expect(user).not_to be_valid
  end

  it "is valid with a unique email" do
    existing_user = User.create(name: "Existing User", email: "existing@example.com", password: "password")
    user = User.new(name: "New User", email: "new@example.com", password: "password")
    expect(user).to be_valid
  end

  it "is invalid with a duplicate email" do
    existing_user = User.create(name: "Existing User", email: "existing@example.com", password: "password")
    user = User.new(name: "Duplicate User", email: "existing@example.com", password: "password")
    expect(user).not_to be_valid
  end
end
