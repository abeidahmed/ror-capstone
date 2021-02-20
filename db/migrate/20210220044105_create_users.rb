class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username, null: false, default: ''
      t.string :full_name, null: false, default: ''
      t.string :photo
      t.string :cover_image
      t.string :password_digest, null: false, default: ''
      t.string :auth_token, null: false, default: ''

      t.timestamps
    end

    add_index :users, :auth_token
    add_index :users, :username
  end
end
