title = "A published article with a long title that may span multiple lines so we can see"
attributes = {
  title:,
  published_at: Time.now,
  content: "Ultricies massa malesuada viverra cras lobortis. Tempor orci hac ligula dapibus mauris sit ut eu. Eget turpis urna maecenas cras. Nisl dictum. Ultricies massa malesuada viverra cras lobortis. Tempor orci hac ligula dapibus mauris sit ut eu. Eget turpis urna maecenas cras. Nisl dictum. Ultricies massa malesuada viverra cras lobortis. Tempor orci hac ligula dapibus mauris sit ut eu. Eget turpis urna maecenas cras. Nisl dictum.\n\n Ultricies massa malesuada viverra cras lobortis. Tempor orci hac ligula dapibus mauris sit ut eu. Eget turpis urna maecenas cras. Nisl dictum."
}

Article.find_or_create_by!(title:) do |article|
  article.assign_attributes(attributes)
end

title2 = Article::LEARNING_ARTICLE_SLUG
attributes = {
  title: title2,
  published_at: Time.now,
  content: "Ultricies massa malesuada viverra cras lobortis. Tempor orci hac ligula dapibus mauris sit ut eu. Eget turpis urna maecenas cras. Nisl dictum. Ultricies massa malesuada viverra cras lobortis. Tempor orci hac ligula dapibus mauris sit ut eu. Eget turpis urna maecenas cras. Nisl dictum. Ultricies massa malesuada viverra cras lobortis. Tempor orci hac ligula dapibus mauris sit ut eu. Eget turpis urna maecenas cras. Nisl dictum.\n\n Ultricies massa malesuada viverra cras lobortis. Tempor orci hac ligula dapibus mauris sit ut eu. Eget turpis urna maecenas cras. Nisl dictum.",
  slug: Article::LEARNING_ARTICLE_SLUG
}

Article.find_or_create_by!(title: title2) do |article|
  article.assign_attributes(attributes)
end

Article.learning_resources.update(title: "technical-courses-books-and-tutorials-on-artificial-"\
  "intelligence-deep-learning-and-machine-learning-for-ai-developers")
