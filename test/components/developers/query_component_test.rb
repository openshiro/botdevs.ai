require "test_helper"

module Developers
  class QueryComponentTest < ViewComponent::TestCase
    include DevelopersHelper
    include FeatureHelper

    setup do
      @user = users(:empty)
    end

    test "renders top countries for developers" do
      query = DeveloperQuery.new({})
      Location.stub :top_countries, ["China", "United States"] do
        render_inline QueryComponent.new(query:, user: @user, form_id: nil)
      end

      assert_selector build_input("countries[]", type: "checkbox", value: "United States")
      assert_selector build_input("countries[]", type: "checkbox", value: "China")
    end

    test "renders unique countries for developers" do
      query = DeveloperQuery.new({})
      render_inline QueryComponent.new(query:, user: @user, form_id: nil)

      assert_selector build_input("countries[]", type: "checkbox", value: "United States")
      assert_selector "label[for=countries_united_states]", text: "United States"
    end

    test "checks selected countries" do
      query = DeveloperQuery.new(countries: ["United States"])
      render_inline QueryComponent.new(query:, user: @user, form_id: nil)

      assert_selector build_input("countries[]", type: "checkbox", value: "United States", checked: true)
    end

    test "checks selected role types" do
      query = DeveloperQuery.new(role_types: ["part_time_contract", "full_time_contract"])
      render_inline QueryComponent.new(query:, user: @user, form_id: nil)

      assert_no_selector build_input("role_types[]", type: "checkbox", value: "full_time_employment", checked: true)
      assert_selector build_input("role_types[]", type: "checkbox", value: "part_time_contract", checked: true)
      assert_selector build_input("role_types[]", type: "checkbox", value: "full_time_contract", checked: true)
    end

    test "checks selected role levels" do
      query = DeveloperQuery.new(role_levels: ["entry_level", "apprentice", "journeyman"])
      render_inline QueryComponent.new(query:, user: @user, form_id: nil)

      assert_selector build_input("role_levels[]", type: "checkbox", value: "entry_level", checked: true)
      assert_selector build_input("role_levels[]", type: "checkbox", value: "apprentice", checked: true)
      assert_selector build_input("role_levels[]", type: "checkbox", value: "journeyman", checked: true)
      assert_no_selector build_input("role_levels[]", type: "checkbox", value: "master", checked: true)
    end

    test "checks selected badges" do
      stub_feature_flag(:badge_filter, true) do
        query = DeveloperQuery.new(badges: ["recently_added"])
        render_inline QueryComponent.new(query:, user: @user, form_id: nil)

        assert_selector build_input("badges[]", type: "checkbox", value: "recently_added", checked: true)
      end
    end

    test "does not render search query input if user does not have subscription" do
      query = DeveloperQuery.new(search_query: "rails")
      render_inline QueryComponent.new(query:, user: @user, form_id: nil)

      assert_no_selector build_input("search_query", type: "text", value: "rails")
    end

    test "checks value of search query if user has subscription" do
      user = users(:subscribed_business)
      query = DeveloperQuery.new(search_query: "rails")
      render_inline QueryComponent.new(query:, user:, form_id: nil)

      assert_selector build_input("search_query", type: "text", value: "rails")
    end

    test "checks option to include developers who aren't interested" do
      query = DeveloperQuery.new(include_not_interested: true)
      render_inline QueryComponent.new(query:, user: @user, form_id: nil)

      assert_selector build_input("include_not_interested", type: "checkbox", checked: true)
    end

    test "collapse location accordion when location is not being queried" do
      create_developer(location_attributes: {country: "Australia"})

      Location.stub :top_countries, ["United States"] do
        query = DeveloperQuery.new
        render_inline QueryComponent.new(query:, user: @user, form_id: nil)
        assert_selector("#location-accordion.hidden")
        assert_selector("#all-locations-accordion.hidden")

        query = DeveloperQuery.new(countries: ["United States"])
        render_inline QueryComponent.new(query:, user: @user, form_id: nil)
        assert_selector("#location-accordion:not(.hidden)")
        assert_selector("#all-locations-accordion.hidden")

        query = DeveloperQuery.new(countries: ["Australia"])
        render_inline QueryComponent.new(query:, user: @user, form_id: nil)
        assert_selector("#location-accordion:not(.hidden)")
        assert_selector("#all-locations-accordion:not(.hidden)")
      end
    end

    def build_input(name, type: nil, value: nil, checked: nil)
      input = "input"
      input += "[checked]" if checked
      input += "[type=#{type}]" if type
      input += "[name='#{name}']"
      input += "[value='#{value}']" if value

      input
    end
  end
end
