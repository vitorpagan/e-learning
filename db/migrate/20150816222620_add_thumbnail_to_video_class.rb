class AddThumbnailToVideoClass < ActiveRecord::Migration
  def change
    add_column :video_classes, :thumbnail, :string
  end
end
