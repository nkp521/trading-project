class NewsComponent < ViewComponent::Base
  def initialize(articles: [])
    @articles = articles || "No articles"
  end

  private

  attr_reader :articles
end
