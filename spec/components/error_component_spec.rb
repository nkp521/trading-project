require 'rails_helper'

RSpec.describe ErrorComponent, type: :component do
  include ViewComponent::TestHelpers

  it "renders error class" do
    user = User.new
    render_inline(ErrorComponent.new(object: user))

    expect(page).to_not have_css('#error_explanation')
  end

  it "returns errors when present" do
    user = User.new
    user.errors.add(:email, "must be present")
    component = ErrorComponent.new(object: user)
    
    expect(component.send(:errors)).to eq(["Email must be present"])
  end

  it "returns no errors when valid" do
    user = User.new
    component = ErrorComponent.new(object: user)
    
    expect(component.send(:errors)).to eq([])
  end
end
