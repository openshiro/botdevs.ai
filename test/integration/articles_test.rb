require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get articles_url
    assert_response :success

    assert_select "h2", "Latest articles"
    assert_select "h3", @article.title
  end

  test "article should not appear if draft" do
    @article.update(content: "foo", published_at: nil)
    get articles_url

    assert_select "li", {count: 0, text: @article.title}
  end

  test "article should not appear if scheduled" do
    @article.update(content: "foo", published_at: 2.days.from_now)
    get articles_url

    assert_select "li", {count: 0, text: @article.title}
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success

    assert_select "h1", @article.title
  end

  test "article should redirect if scheduled" do
    @article.update(content: "foo", published_at: 2.days.from_now)
    get article_url(@article)
    assert_response :redirect

    assert_select "h1", {count: 0, text: @article.title}
  end

  test "article should redirect if draft" do
    @article.update(content: "foo", published_at: nil)
    get article_url(@article)
    assert_response :redirect

    assert_select "h1", {count: 0, text: @article.title}
  end
end
