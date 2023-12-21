module ArticlesHelper
  def show_updated?(article)
    article.updated_at > article.published_at + 3.days
  end
end
