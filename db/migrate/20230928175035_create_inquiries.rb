class CreateInquiries < ActiveRecord::Migration[7.0]
  def change
    create_table :inquiries do |t|
      t.references :contact, foreign_key: true
      t.string :email, null: false
      t.string :name

      t.timestamps
    end
  end
end
