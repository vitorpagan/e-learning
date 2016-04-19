class AddThumbnailToProfessional < ActiveRecord::Migration
  def change
    add_column :professionals, :thumbnail, :string
  end
end
