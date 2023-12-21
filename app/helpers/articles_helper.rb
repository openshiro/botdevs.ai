module ArticlesHelper
  def show_updated?(article)
    article.updated_at > article.published_at + 3.days
  end

  def show_appeared?(article)
    return false unless article.canonical_url.present?

    article.canonical_url.match?(/openshiro\.com/)
  end
end
