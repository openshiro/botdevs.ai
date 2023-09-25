require "test_helper"

class AboutTest < ActionDispatch::IntegrationTest
  test "renders both sections of markdown" do
    get about_path

    assert_select "h3", "Empowering solar professionals"
    assert_select "li", "Empowering solar professionals"
  end

  test "defaults to English translation" do
    get about_path(locale: "zh-TW")

    assert_select "h3", "Empowering solar professionals"
    assert_select "li", "Empowering solar professionals"
  end
end
