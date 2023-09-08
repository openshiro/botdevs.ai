require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article = articles(:one)
  end

  test "#draft? responds correctly " do
    @article.published_at = nil

    assert @article.draft?
  end
end
