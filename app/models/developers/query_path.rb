module Developers
  class QueryPath
    include UrlHelpersWithDefaultUrlOptions

    def self.all
      new.all
    end

    def all
      paths = []

      RoleLevel::TYPES.each do |role_level|
        paths += build_paths(role_level:)

        top_states.each do |state|
          paths += build_paths(role_level:, state:)
        end
      end

      top_states.each do |state|
        paths += build_paths(state:)
      end

      paths
    end

    private

    def top_states
      @top_states ||= Location.top_states
    end

    def build_paths(role_level: nil, state: nil)
      [
        build_path(role_level:, state:),
        build_path(role_level:, state:, freelance: true)
      ]
    end

    def build_path(role_level: nil, state: nil, freelance: false)
      options = {}
      options[:role_levels] = [role_level] if role_level.present?
      options[:states] = [state] if state.present?
      options[:role_types] = [:part_time_contract, :full_time_contract] if freelance
      developers_path(options)
    end
  end
end
