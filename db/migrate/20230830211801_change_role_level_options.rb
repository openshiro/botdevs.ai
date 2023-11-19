class ChangeRoleLevelOptions < ActiveRecord::Migration[7.0]
  def change
    rename_column :role_levels, :junior, :junior
    rename_column :role_levels, :mid, :apprentice
    rename_column :role_levels, :senior, :journeyman
    rename_column :role_levels, :principal, :master
    remove_column :role_levels, :c_level, :boolean
  end
end
