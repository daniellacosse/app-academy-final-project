class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.references :viewable, polymorphic: true
      t.timestamps
    end
  end
end
