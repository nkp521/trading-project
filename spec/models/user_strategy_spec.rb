require 'rails_helper'

RSpec.describe UserStrategy, type: :model do
  it 'has a valid user_strategy' do
    expect(build(:user_strategy)).to be_valid
  end
end
