require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get articles_url
    assert_response :success

    assert_select "h1", "Articles"
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success

    assert_select "h1", @article.title
  end
end
