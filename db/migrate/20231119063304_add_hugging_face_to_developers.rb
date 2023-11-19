class AddHuggingFaceToDevelopers < ActiveRecord::Migration[7.0]
  def change
    add_column :developers, :hugging_face, :string
  end
end
