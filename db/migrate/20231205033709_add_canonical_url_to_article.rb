class AddCanonicalUrlToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :canonical_url, :string
  end
end
