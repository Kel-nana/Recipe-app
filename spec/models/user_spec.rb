require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is invalid without a name' do
      user = User.new(email: 'enomma@example.com', password: 'password')
      expect(user).to be_invalid
    end

    it 'is invalid without an email' do
      user = User.new(name: 'enobong', password: 'password')
      expect(user).to be_invalid
    end

    it 'is invalid without a password' do
      user = User.new(name: 'enobong', email: 'enomma@example.com')
      expect(user).to be_invalid
    end
  end

  describe 'associations' do
    it 'has many recipes' do
      association = described_class.reflect_on_association(:recipes)
      expect(association.macro).to eq(:has_many)
    end    
  end
end
