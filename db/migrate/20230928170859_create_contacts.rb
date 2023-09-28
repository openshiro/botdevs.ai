class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :name
      t.boolean :subscribed, default: true, null: false

      t.timestamps
    end
  end
end
