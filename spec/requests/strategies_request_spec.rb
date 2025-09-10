require 'rails_helper'

RSpec.describe "Strategies", type: :request do
  describe "POST /users/:user_id/strategies" do
    it "creates a strategy for the signed-in user" do
      user = create(:user)
      sign_in user

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
      follow_redirect!
      expect(response.body).to include("Strategy created")
    end
  end
end
