require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is valid with a name and icon' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    group = user.groups.build(name: 'Test Group', icon: 'https://example.com/icon.png')
    expect(group).to be_valid
  end

  it 'is invalid without a name' do
    group = Group.new(icon: 'https://example.com/icon.png')
    expect(group).not_to be_valid
  end

  it 'is invalid without an icon' do
    group = Group.new(name: 'Test Group')
    expect(group).not_to be_valid
  end

  it 'has a default icon if none is provided' do
    group = Group.new(name: 'Test Group')
    expect(group.icon).to eq('https://www.pngmart.com/files/23/Art-PNG-Free-Download.png')
  end
end
