require 'rails_helper'

RSpec.describe LoginSignupComponent, type: :component do
  include ViewComponent::TestHelpers

  it "renders login form" do
    user = User.new
    login_user = User.new
    
    render_inline(LoginSignupComponent.new(form_type: "login", user: user, login_user: login_user))

    expect(page).to have_text("Login")
  end

  it "renders signup form" do
    user = User.new
    login_user = User.new
    
    render_inline(LoginSignupComponent.new(form_type: "signup", user: user, login_user: login_user))

    expect(page).to have_text("Sign Up")
  end
end
