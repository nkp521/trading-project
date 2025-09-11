require 'rails_helper'

RSpec.describe "Strategies", type: :request do
  describe "POST /users/:user_id/strategies" do
    let(:strategy_params) do
      {
        name: "strategy",
        description: "description",
        long_entry: "long_entry",
        short_entry: "short_entry",
        risk_level: "Low"
      }
    end

    it "creates a strategy if the user is signed-in" do
      user = create(:user)
      post user_session_path, params: { user: { email: user.email, password: 'password123' } }

      expect {
        post user_strategies_path(user), params: { strategy: strategy_params }
      }.to change { Strategy.count }.by(1)

      expect(Strategy.first).to have_attributes(strategy_params)
      expect(response).to redirect_to(strategies_path)
    end
  end
end
