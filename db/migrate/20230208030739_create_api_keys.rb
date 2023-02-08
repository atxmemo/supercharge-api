class CreateApiKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :api_keys do |t|
      t.belongs_to :user, null: false
      t.string :token, null: false
      t.timestamps null: false
    end

    add_index :api_keys, :user
    add_index :api_keys, :token
  end
end
