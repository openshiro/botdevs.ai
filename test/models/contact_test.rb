require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test "normalizes emails" do
    contact = contacts(:one)
    contact.email = "FooBar@bash.com "
    assert contact.email == "foobar@bash.com"
  end
end
