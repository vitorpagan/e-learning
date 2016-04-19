class AddColumnsToVideoClass < ActiveRecord::Migration
  def change
    remove_column :video_classes, :url
    add_column :video_classes, :embed_ios, :text
    add_column :video_classes, :embed_android, :text
    add_column :video_classes, :embed, :text
  end
end
