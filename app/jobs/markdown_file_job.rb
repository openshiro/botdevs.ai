# app/jobs/markdown_file_job.rb
require "net/http"
require "redcarpet"
require "nokogiri"

class MarkdownFileJob < ApplicationJob
  queue_as :default

  def perform
    url = Article::LEARNING_RESOURCES_URL
    uri = URI(url)

    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess)
      markdown_content = response.body
      html_content = render_markdown(markdown_content)

      # Parse the HTML content with Nokogiri
      doc = Nokogiri::HTML(html_content)

      # Find and remove the first H2 tag
      first_h2_tag = doc.at("h2")
      if first_h2_tag
        first_h2_tag.remove
        updated_html_content = doc.to_html
        save_updated_content(first_h2_tag, updated_html_content)
      else
        Honeybadger.notify("No H2 tags found in the HTML content.")
      end
    else
      Honeybadger.notify("Error fetching markdown file")
    end
  end

  private

  def render_markdown(markdown_content)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(markdown_content)
  end

  def save_updated_content(title, updated_html_content)
    article = Article.learning_resources
    if article.title != title || article.content != updated_html_content
      article.update(title: title, content: updated_html_content)
    end
  end
end
