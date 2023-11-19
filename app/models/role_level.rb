class RoleLevel < ApplicationRecord
  TYPES = %i[junior mid senior principal].freeze

  belongs_to :developer

  def missing_fields?
    TYPES.none? { |t| send(t) }
  end
end
