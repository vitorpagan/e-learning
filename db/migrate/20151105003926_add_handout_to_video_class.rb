class AddHandoutToVideoClass < ActiveRecord::Migration
  def change
    add_column :video_classes, :handout, :string
  end
end
