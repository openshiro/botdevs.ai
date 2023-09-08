class ArticlesController < ApplicationController

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
    @article = Article.friendly.find(params[:id])
  end
end
