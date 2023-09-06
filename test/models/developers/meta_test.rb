require "test_helper"

class Developers::MetaTest < ActiveSupport::TestCase
  test "displays role level when one is selected" do
    title = build_title(role_levels: [:entry_level])
    assert_equal title, "Hire entry-level electricians"

    title = build_title(role_levels: [:entry_level, :journeyman])
    assert_equal title, "Hire electricians"

    title = build_title(role_levels: [])
    assert_equal title, "Hire electricians"
  end

  test "displays 'freelance' when only both contract role types are selected" do
    title = build_title(role_types: [:part_time_contract, :full_time_contract])
    assert_equal title, "Hire freelance electricians"

    title = build_title(role_types: [:part_time_contract, :full_time_contract, :full_time_employment])
    assert_equal title, "Hire electricians"

    title = build_title(role_types: [:part_time_contract])
    assert_equal title, "Hire electricians"
  end

  test "displays state if one is selected" do
    title = build_title(states: ["Oregon"])
    assert_equal title, "Hire electricians in Oregon"

    title = build_title(states: ["Oregon", "Washington"])
    assert_equal title, "Hire electricians"

    title = build_title(states: [])
    assert_equal title, "Hire electricians"
  end

  test "role level comes before freelance (and country at the end)" do
    title = build_title(
      role_levels: [:journeyman],
      role_types: [:part_time_contract, :full_time_contract],
      states: ["Oregon"]
    )
    assert_equal title, "Hire journeyman freelance electricians in Oregon"
  end

  def build_title(query_options = {})
    query = DeveloperQuery.new(query_options)
    Developers::Meta.new(query:, count: 190).title
  end
end
