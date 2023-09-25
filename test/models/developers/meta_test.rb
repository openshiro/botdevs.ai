require "test_helper"

class Developers::MetaTest < ActiveSupport::TestCase
  test "displays role level when one is selected" do
    title = build_title(role_levels: [:entry_level])
    assert_equal title, "Hire entry-level energy professionals"

    title = build_title(role_levels: [:entry_level, :journeyman])
    assert_equal title, "Hire energy professionals"

    title = build_title(role_levels: [])
    assert_equal title, "Hire energy professionals"
  end

  test "displays 'independent' when only both contract role types are selected" do
    title = build_title(role_types: [:part_time_contract, :full_time_contract])
    assert_equal title, "Hire independent energy professionals"

    title = build_title(role_types: [:part_time_contract, :full_time_contract, :full_time_employment])
    assert_equal title, "Hire energy professionals"

    title = build_title(role_types: [:part_time_contract])
    assert_equal title, "Hire energy professionals"
  end

  test "displays state if one is selected" do
    title = build_title(states: ["Oregon"])
    assert_equal title, "Hire energy professionals in Oregon"

    title = build_title(states: ["Oregon", "Washington"])
    assert_equal title, "Hire energy professionals"

    title = build_title(states: [])
    assert_equal title, "Hire energy professionals"
  end

  test "role level comes before independent (and country at the end)" do
    title = build_title(
      role_levels: [:journeyman],
      role_types: [:part_time_contract, :full_time_contract],
      states: ["Oregon"]
    )
    assert_equal title, "Hire journeyman independent energy professionals in Oregon"
  end

  def build_title(query_options = {})
    query = DeveloperQuery.new(query_options)
    Developers::Meta.new(query:, count: 190).title
  end
end
