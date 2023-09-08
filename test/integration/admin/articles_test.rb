require "test_helper"

class Admin::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
    user = users(:admin)
    sign_in(user)
  end

  test "should get index" do
    get admin_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference("Article.count") do
      post admin_articles_url, params: { article: { published_at: @article.published_at, status: @article.status, title: "Bar", content: "Foo" } }
    end

    assert_redirected_to admin_article_url(Article.last)
  end

  test "should show article" do
    get admin_article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch admin_article_url(@article), params: { article: { published_at: @article.published_at, status: @article.status, title: "Bar", content: "Foo" } }
    assert_redirected_to admin_article_url(@article.slug)
  end

  test "should destroy article" do
    assert_difference("Article.count", -1) do
      delete admin_article_url(@article)
    end

    assert_redirected_to admin_articles_url
  end
end
