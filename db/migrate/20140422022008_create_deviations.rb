class CreateDeviations < ActiveRecord::Migration
  def change
    create_table :deviations do |t|
      t.string :title,      null: false
      t.text :description
      t.integer :user_id,   null: false
      
      t.boolean :is_mature,       null: false
      t.boolean :is_commentable,  null: false
      t.boolean :is_shareable,    null: false
      t.boolean :is_likeable,     null: false
      t.boolean :is_DRM,          null: false
      t.boolean :is_CC,           null: false
      t.boolean :can_remix,       null: false

      t.timestamps
    end
    
    add_index :deviations, :user_id
    add_index :deviations, [:user_id, :title], unique: true
  end
end
