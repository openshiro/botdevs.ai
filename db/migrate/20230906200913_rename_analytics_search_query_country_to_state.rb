class RenameAnalyticsSearchQueryCountryToState < ActiveRecord::Migration[7.0]
  def change
    rename_column :analytics_search_queries, :countries, :states
  end
end
