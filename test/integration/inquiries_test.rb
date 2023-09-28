require "test_helper"

class InquiriesTest < ActionDispatch::IntegrationTest
  setup do
    @inquiry = inquiries(:one)
  end

  test "should get new" do
    get new_inquiry_url
    assert_response :success
  end

  test "should create inquiry" do
    assert_difference("Inquiry.count") do
      post inquiries_url, params: { inquiry: { email: @inquiry.email, name: @inquiry.name } }
    end
  end
end
