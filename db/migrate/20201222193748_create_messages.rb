class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :title, null: false
      t.string :whom, null: false
      t.text :message
      t.data :open_plan
      t.string :encrypted_password
      t.references :user_id, null: false
      t.timestamps
    end
  end
end
