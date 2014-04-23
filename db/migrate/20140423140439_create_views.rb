class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.integer :user_id
      t.references :viewable, polymorphic: true
      t.timestamps
    end

    add_index :views, :user_id
  end
end
