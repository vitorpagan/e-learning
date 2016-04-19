class RemoveExcerptFromVideoClass < ActiveRecord::Migration
  def change
    remove_column :video_classes, :excerpt, :string
  end
end
