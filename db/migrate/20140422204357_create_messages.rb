class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string  :title, null: false
      t.text  :body, null: false
      t.integer :user_id, null: false
      t.integer :author_id, null: false

      t.timestamps
    end

    add_index :messages, :user_id
    add_index :messages, :author_id
  end
end
