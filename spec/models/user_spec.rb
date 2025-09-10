require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'validations' do
    it 'requires a username' do
      expect(build(:user, username: nil)).not_to be_valid
    end
  end
end
