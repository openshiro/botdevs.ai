class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true

  scope :sorted, -> { order(arel_table[:published_at].desc.nulls_last).order(updated_at: :desc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at >= ?", Time.current) }
  LEARNING_RESOURCES_URL = "https://raw.githubusercontent.com/duncantmiller/"\
                           "ai-developer-resources/main/README.md".freeze
  LEARNING_ARTICLE_SLUG = "technical-ai-courses-books-and-tutorials-for-ai-developers".freeze

  def self.learning_resources
    Article.friendly.find(LEARNING_ARTICLE_SLUG)
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

  def draft?
    published_at.nil?
  end

  def published?
    return unless published_at?

    published_at <= Time.current
  end

  def scheduled?
    return unless published_at?

    published_at >= Time.current
  end
end
