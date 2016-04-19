class RemoveOrderFromVideoClass < ActiveRecord::Migration
  def change
    remove_column :video_classes, :order, :integer
  end
end
