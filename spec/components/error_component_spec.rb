require 'rails_helper'

RSpec.describe ErrorComponent, type: :component do
  include ViewComponent::TestHelpers

  it "renders" do
    user = User.new
    render_inline(ErrorComponent.new(object: user))

    expect(page).to_not have_css('#error_explanation')
  end
end
