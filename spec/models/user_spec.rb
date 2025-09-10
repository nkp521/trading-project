require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'validations' do
    it 'requires a username' do
      expect(build(:user, username: nil)).not_to be_valid
    end

    it 'requires a unique username' do
      create(:user, username: 'user1')
      duplicate = build(:user, username: 'user1')
      expect(duplicate).not_to be_valid
    end

    it 'requires 3 characters atleast 3 characters for username' do
      expect(build(:user, username: 'ab')).not_to be_valid
    end
  end
end
