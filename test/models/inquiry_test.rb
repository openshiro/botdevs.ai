require "test_helper"

class InquiryTest < ActiveSupport::TestCase
  setup do
    @inquiry = inquiries(:one)
  end

  test "normalizes emails" do
    @inquiry.email = "FooBar@bash.com "
    assert @inquiry.email == "foobar@bash.com"
  end
end
