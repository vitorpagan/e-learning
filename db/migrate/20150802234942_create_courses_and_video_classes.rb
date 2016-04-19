class CreateCoursesAndVideoClasses < ActiveRecord::Migration
  def change
    create_table :courses_video_classes, id: false do |t|
      t.belongs_to :course, index: true
      t.belongs_to :video_class, index: true
    end
  end
end