class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag
      t.references :taggable, polymorphic: true

      t.timestamps
    end
  end
end
