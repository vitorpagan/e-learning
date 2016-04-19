class AddThumbnailToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :thumbnail, :string
  end
end
