class AddProfessionalToVideoClass < ActiveRecord::Migration
  def change
    add_reference :video_classes, :professional, index: true
    add_foreign_key :video_classes, :professionals
  end
end
