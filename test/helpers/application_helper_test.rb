require "test_helper"
require "application_helper"

class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper

  test "language_formatter adds language to pre tag" do
    unformatted_text = "<pre>python \n\nfoo"
    formatted_text = language_formatter(unformatted_text)

    assert_equal true, formatted_text.include?("<pre class=\"hljs language-python\">")
  end

  test "language_formatter does not affect other tags" do
    unformatted_text = "<p>python \n\nfoo"
    formatted_text = language_formatter(unformatted_text)

    assert_equal false, formatted_text.include?("class=\"hljs language-python\"")
  end
end
