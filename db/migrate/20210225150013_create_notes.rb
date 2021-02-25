class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.belongs_to :user, null: false
      t.string :title, null: false
      t.string :uuid
      t.text :content
      t.integer :visibility_setting, null: false, default: 0
      t.integer :programming_language
      t.datetime :expires_at

      t.timestamps
    end
  end
end
