require "test_helper"
require "articles_helper"

class ArticlesHelperTest < ActionView::TestCase
  include ArticlesHelper

  def setup
    @article = Article.new
  end

  test "show_updated? returns true if updated more than 3 days after created" do
    @article.published_at = Time.now - 5.days
    @article.updated_at = Time.now

    assert_equal true, show_updated?(@article)
  end

  test "show_updated? returns false if updated within 3 days after created" do
    @article.published_at = Time.now
    @article.updated_at = Time.now + 2.days

    assert_equal false, show_updated?(@article)
  end

  test "show_appeared? returns true cannonical url matches openshiro" do
    @article.canonical_url = "https://openshiro.com/foo"
    assert_equal true, show_appeared?(@article)
    @article.canonical_url = "https://www.openshiro.com/foo"
    assert_equal true, show_appeared?(@article)
  end

  test "show_appeared? returns false if canonical url blank or other address" do
    assert_equal false, show_appeared?(@article)
    @article.canonical_url = "https://github.com/foo"
    assert_equal false, show_appeared?(@article)
  end
end
