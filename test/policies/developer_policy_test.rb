require "test_helper"

class DeveloperPolicyTest < ActiveSupport::TestCase
  include DevelopersHelper

  test "update their own professional profile" do
    user = users(:developer)
    assert DeveloperPolicy.new(user, user.developer).update?
  end

  test "cannot update another's professional profile" do
    user = users(:developer)
    developer = developers(:prospect)

    refute DeveloperPolicy.new(user, developer).update?
  end

  test "view their own invisible professional profile" do
    developer = create_invisible_developer!
    assert DeveloperPolicy.new(developer.user, developer).show?
  end

  test "cannot view another's invisible professional profile" do
    user = users(:developer)
    developer = create_invisible_developer!
    refute DeveloperPolicy.new(user, developer).show?
  end

  test "admin can view another's invisible professional profile" do
    user = users(:admin)
    developer = create_invisible_developer!
    assert DeveloperPolicy.new(user, developer).show?
  end

  test "can share their own professional profile" do
    user = users(:developer)
    assert DeveloperPolicy.new(user, user.developer).share_profile?
  end

  def create_invisible_developer!
    Developer.create!(developer_attributes.merge(search_status: :invisible))
  end
end
