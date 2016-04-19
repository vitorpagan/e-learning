class CreatePrerequisitesAndVideoClasses < ActiveRecord::Migration
  def change
    create_table :prerequisites_video_classes, id: false do |t|
      t.belongs_to :prerequisite, index: true
      t.belongs_to :video_class, index: true
    end
  end
end