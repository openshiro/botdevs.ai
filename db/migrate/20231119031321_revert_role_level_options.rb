class RevertRoleLevelOptions < ActiveRecord::Migration[7.0]
  def change
    rename_column :role_levels, :entry_level, :junior
    rename_column :role_levels, :apprentice, :mid
    rename_column :role_levels, :journeyman, :senior
    rename_column :role_levels, :master, :principal
    add_column :role_levels, :c_level, :boolean
  end
end
