require "test_helper"

class AboutTest < ActionDispatch::IntegrationTest
  test "renders both sections of markdown" do
    get about_path

    assert_select "h3", "Championing all AI/ML developers and their work"
    assert_select "li", "Championing all AI/ML developers and their work"
  end

  test "defaults to English translation" do
    get about_path(locale: "zh-TW")

    assert_select "h3", "Championing all AI/ML developers and their work"
    assert_select "li", "Championing all AI/ML developers and their work"
  end
end
