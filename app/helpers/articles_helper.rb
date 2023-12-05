module ArticlesHelper
  def show_updated?(article)
    article.updated_at > article.created_at + 3.days
  end
end
