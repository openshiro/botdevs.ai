require "test_helper"

class InquiryTest < ActiveSupport::TestCase
  setup do
    @inquiry = inquiries(:one)
  end

  test "normalizes emails" do
    @inquiry.email = "FooBar@bash.com "
    assert @inquiry.email == "foobar@bash.com"
  end

  test "creates new contact if none exists" do
    new_inquiry = Inquiry.new(email: "test@test.com")
    assert_difference("Contact.count") do
      new_inquiry.save!
    end
    assert new_inquiry.contact.email == "test@test.com"
  end

  test "matches contact but does not create new contact if one exists" do
    contact = contacts(:one)
    new_inquiry = Inquiry.new(email: contact.email)
    assert_no_changes("Contact.count") do
      new_inquiry.save!
    end
    assert new_inquiry.contact == contact
  end
end
