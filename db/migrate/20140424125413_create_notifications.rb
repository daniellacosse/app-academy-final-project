class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :notifier_id
      t.integer :notification_type
      t.references :notifiable, polymorphic: true
      t.boolean :was_seen, default: false

      t.timestamps
    end

    add_index :notifications, :user_id
    add_index :notifications, :notifier_id
  end
end
