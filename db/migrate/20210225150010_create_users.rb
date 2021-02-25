class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :api_key, null: false

      t.timestamps
    end
  end
end
