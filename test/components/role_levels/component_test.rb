require "test_helper"

module RoleLevels
  class ComponentTest < ViewComponent::TestCase
    test "doesn't render with no role levels selected" do
      role_level = role_levels(:none)
      render_inline Component.new(role_level)
      refute_component_rendered
    end

    test "renders each selected role level" do
      role_level = role_levels(:some)

      render_inline Component.new(role_level)

      assert_text RoleLevel.human_attribute_name("entry_level")
      assert_text RoleLevel.human_attribute_name("journeyman")
      assert_text RoleLevel.human_attribute_name("master")
      assert_no_text RoleLevel.human_attribute_name("apprentice")
    end
  end
end
