class AddUrlToVideoClass < ActiveRecord::Migration
  def change
    add_column :video_classes, :url, :string
  end
end
