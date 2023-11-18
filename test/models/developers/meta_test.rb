require "test_helper"

class Developers::MetaTest < ActiveSupport::TestCase
  test "displays role level when one is selected" do
    title = build_title(role_levels: [:entry_level])
    assert_equal title, "Hire entry-level AI/ML developers"

    title = build_title(role_levels: [:entry_level, :journeyman])
    assert_equal title, "Hire AI/ML developers"

    title = build_title(role_levels: [])
    assert_equal title, "Hire AI/ML developers"
  end

  test "displays 'independent' when only both contract role types are selected" do
    title = build_title(role_types: [:part_time_contract, :full_time_contract])
    assert_equal title, "Hire independent AI/ML developers"

    title = build_title(role_types: [:part_time_contract, :full_time_contract, :full_time_employment])
    assert_equal title, "Hire AI/ML developers"

    title = build_title(role_types: [:part_time_contract])
    assert_equal title, "Hire AI/ML developers"
  end

  test "displays country if one is selected" do
    title = build_title(countries: ["United States"])
    assert_equal title, "Hire AI/ML developers in United States"

    title = build_title(countries: ["United States", "Canada"])
    assert_equal title, "Hire AI/ML developers"

    title = build_title(countries: [])
    assert_equal title, "Hire AI/ML developers"
  end

  test "role level comes before independent (and country at the end)" do
    title = build_title(
      role_levels: [:journeyman],
      role_types: [:part_time_contract, :full_time_contract],
      countries: ["United States"]
    )
    assert_equal title, "Hire journeyman independent AI/ML developers in United States"
  end

  def build_title(query_options = {})
    query = DeveloperQuery.new(query_options)
    Developers::Meta.new(query:, count: 190).title
  end
end
