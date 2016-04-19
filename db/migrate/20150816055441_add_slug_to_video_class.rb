class AddSlugToVideoClass < ActiveRecord::Migration
  def change
    add_column :video_classes, :slug, :string
  end
end
