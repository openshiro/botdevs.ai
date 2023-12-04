class ArticlesController < ApplicationController
  # GET /articles
  def index
    @articles = Article.published.sorted
  end

  # GET /articles/1
  def show
    @article = Article.friendly.find(params[:id])

    if request.path != article_path(@article)
      redirect_to article_path(@article)
      return
    end

    redirect_to root_path unless @article.published?
  end
end
