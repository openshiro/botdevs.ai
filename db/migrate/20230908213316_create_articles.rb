class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :status
      t.datetime :published_at

      t.timestamps
    end
  end
end
