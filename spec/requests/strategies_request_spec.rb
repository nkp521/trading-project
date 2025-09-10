require 'rails_helper'

RSpec.describe "Strategies", type: :request do
  describe "POST /users/:user_id/strategies" do
    it "creates a strategy if the user is signed-in" do
      user = create(:user)
      post user_session_path, params: { user: { email: user.email, password: 'password123' } }

      expect {
        post user_strategies_path(user), params: {
          strategy: {
            name: "strategy",
            description: "description",
            long_entry: "long",
            short_entry: "short",
            risk_level: "Low"
          }
        }
      }.to change { Strategy.count }.by(1)

      expect(response).to redirect_to(strategies_path)
    end
  end
end
