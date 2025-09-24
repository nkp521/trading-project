class LoginSignupComponent < ViewComponent::Base
  def initialize(form_type:, user:, login_user:)
    @form_type = form_type
    @user = user
    @login_user = login_user
  end

private

  attr_reader :form_type, :user, :login_user
end
