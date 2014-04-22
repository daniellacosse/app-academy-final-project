class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string  :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end

    add_index :galleries, :user_id
  end
end
