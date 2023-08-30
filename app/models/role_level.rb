class RoleLevel < ApplicationRecord
  TYPES = %i[entry_level apprentice journeyman master].freeze

  belongs_to :developer

  def missing_fields?
    TYPES.none? { |t| send(t) }
  end
end
