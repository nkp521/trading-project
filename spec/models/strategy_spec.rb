require 'rails_helper'

RSpec.describe Strategy, type: :model do
  it 'has a valid strategy' do
    expect(build(:strategy)).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:long_entry) }
    it { should validate_presence_of(:short_entry) }
    it { should validate_inclusion_of(:risk_level).in_array(%w[Low Medium High]) }
  end

  describe 'associations' do
    it { should have_many(:user_strategies) }
    it { should have_many(:users).through(:user_strategies) }
  end

  describe 'scopes' do
    it 'returns strategies matching the given risk level from the filter' do
      low  = create(:strategy, risk_level: 'Low', name: 'low')
      medium = create(:strategy, risk_level: 'Medium', name: 'medium')
      high = create(:strategy, risk_level: 'High', name: 'high')

      results = Strategy.with_risk('Low')

      expect(results).to include(low)
      expect(results).not_to include(medium)
      expect(results).not_to include(high)
    end
  end
end
