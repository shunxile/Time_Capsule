class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :title, null: false
      t.text :message
      t.data :open_plan
      t.string :encrypted_password
      t.timestamps
    end
  end
end
