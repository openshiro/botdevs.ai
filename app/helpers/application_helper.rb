module ApplicationHelper
  def language_formatter(content)
    doc = Nokogiri::HTML.fragment(content.to_s)
    doc.css("pre").each do |pre|
      language = pre.content.split.first
      if language
        pre.content = pre.content.sub(language, "")
        pre["class"] = "hljs language-#{language}"
      end
    end
    doc.to_html
  end

  def hotwire_livereload_tags
    super if Rails.env.development?
  end

  def stylesheet_link_tags
    stylesheets =
      if Feature.enabled?(:redesign)
        ["redesign", "fonts"]
      else
        ["application", "inter", "actiontext"]
      end

    stylesheet_link_tag(*stylesheets, media: "all", "data-turbo-track": "reload")
  end
end
