class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets, id: :uuid do |t|
      t.integer :author_id, null: false
      t.text :text, null: false, default: ''

      t.timestamps
    end

    add_index :tweets, :author_id
  end
end
