class CreateMessageTagForms < ActiveRecord::Migration[6.0]
  def change
    create_table :message_tag_forms do |t|
      t.references :message, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
