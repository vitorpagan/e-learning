class CreateUserVideos < ActiveRecord::Migration
  def change
    create_table :user_videos do |t|
      t.references :user, index: true
      t.references :video_class, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_videos, :users
    add_foreign_key :user_videos, :video_classes
  end
end
