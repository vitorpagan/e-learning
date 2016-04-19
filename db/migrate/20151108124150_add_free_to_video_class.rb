class AddFreeToVideoClass < ActiveRecord::Migration
  def change
    add_column :video_classes, :free, :boolean, default: false
  end
end
