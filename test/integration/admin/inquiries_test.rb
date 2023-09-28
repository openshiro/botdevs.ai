require "test_helper"

class InquiriesTest < ActionDispatch::IntegrationTest
  setup do
    @inquiry = inquiries(:one)
    user = users(:admin)
    sign_in(user)
  end

  test "admin should get index" do
    get admin_inquiries_url
    assert_response :success
  end

  test "admin should get new" do
    get new_admin_inquiry_url
    assert_response :success
  end

  test "admin should create inquiry" do
    assert_difference("Inquiry.count") do
      post admin_inquiries_url, params: {inquiry: {email: @inquiry.email, name: @inquiry.name}}
    end

    assert_redirected_to admin_inquiry_url(Inquiry.last)
  end

  test "admin should show inquiry" do
    get admin_inquiry_url(@inquiry)
    assert_response :success
  end
end
