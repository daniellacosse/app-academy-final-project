class CreateGalleryDeviations < ActiveRecord::Migration
  def change
    create_table :gallery_deviations do |t|
      t.integer :gallery_id
      t.integer :deviation_id
    end

    add_index :gallery_deviations, :gallery_id
    add_index :gallery_deviations, :deviation_id
  end
end
