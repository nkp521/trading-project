require 'rails_helper'

RSpec.describe CandlestickBackgroundComponent, type: :component do
  include ViewComponent::TestHelpers

  it "renders 15 candles" do
    render_inline(CandlestickBackgroundComponent.new)

    expect(page).to have_css(".candle", count: 15)
  end
end
