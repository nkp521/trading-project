require 'rails_helper'

RSpec.describe Strategy, type: :model do
  it 'has a valid strategy' do
    expect(build(:strategy)).to be_valid
  end
end
