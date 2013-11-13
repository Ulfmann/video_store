class CreateVideoViews < ActiveRecord::Migration
  def change
    create_table :video_views do |t|
      t.integer :user_id
      t.integer :subscription_id
      t.integer :video_id
      t.time :create_at

      t.timestamps
    end
  end
end
