require 'rails_helper'

RSpec.describe Strategy, type: :model do
  it 'has a valid strategy' do
    expect(build(:strategy)).to be_valid
  end

  describe 'validations' do
    it 'requires a valid name' do
      expect(build(:strategy, name: nil)).not_to be_valid
    end
  end

  it 'requires a unique name' do
    create(:strategy, name: 'strategy')
    duplicate = build(:strategy, name: 'strategy')
    expect(duplicate).not_to be_valid
  end

  it 'requires a description' do
    expect(build(:strategy, description: nil)).not_to be_valid
  end

  it 'requires a long_entry' do
    expect(build(:strategy, long_entry: nil)).not_to be_valid
  end

  it 'requires a short_entry' do
    expect(build(:strategy, short_entry: nil)).not_to be_valid
  end

  it 'requires a risk_level' do
    expect(build(:strategy, risk_level: nil)).not_to be_valid
  end

  it 'requires a valid risk_level' do
    expect(build(:strategy, risk_level: 'Medium')).to be_valid
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
