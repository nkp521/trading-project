require 'rails_helper'

RSpec.describe Strategy, type: :model do
  it 'has a valid strategy' do
    expect(build(:strategy)).to be_valid
  end

  describe 'validations' do
    it 'requires a name' do
      expect(build(:strategy, name: nil)).not_to be_valid
    end
  end

  it 'requires a unique name' do
    create(:strategy, name: 'strategy')
    duplicate = build(:strategy, name: 'strategy')
    expect(duplicate).not_to be_valid
  end
end
