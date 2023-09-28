class ArticlesController < ApplicationController
  # GET /articles
  def index
    @articles = Article.published.sorted
  end

  # GET /articles/1
  def show
    @article = Article.friendly.find(params[:id])

    redirect_to root_path unless @article.published?
  end
end
