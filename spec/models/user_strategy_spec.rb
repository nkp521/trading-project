require 'rails_helper'

RSpec.describe UserStrategy, type: :model do
  subject { create(:user_strategy) }

  it 'has a valid user_strategy' do
    expect(build(:user_strategy)).to be_valid
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:strategy) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:strategy_id).scoped_to(:user_id) }
  end
end
