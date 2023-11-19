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

      assert_text RoleLevel.human_attribute_name("junior")
      assert_text RoleLevel.human_attribute_name("senior")
      assert_text RoleLevel.human_attribute_name("mid")
      assert_no_text RoleLevel.human_attribute_name("principal")
    end

    test "renders all selected role levels" do
      role_level = role_levels(:all)

      render_inline Component.new(role_level)

      assert_text RoleLevel.human_attribute_name("junior")
      assert_text RoleLevel.human_attribute_name("senior")
      assert_text RoleLevel.human_attribute_name("mid")
      assert_text RoleLevel.human_attribute_name("principal")
    end
  end
end
