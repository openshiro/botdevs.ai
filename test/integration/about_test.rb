require "test_helper"

class AboutTest < ActionDispatch::IntegrationTest
  test "renders both sections of markdown" do
    get about_path

    assert_select "h3", "Empowering electricians"
    assert_select "li", "Empowering electricians"
  end

  test "defaults to English translation" do
    get about_path(locale: "zh-TW")

    assert_select "h3", "Empowering electricians"
    assert_select "li", "Empowering electricians"
  end
end
