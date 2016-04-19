class CreatePublicTargetsAndVideoClasses < ActiveRecord::Migration
  def change
    create_table :public_targets_video_classes, id: false do |t|
      t.belongs_to :public_target, index: true
      t.belongs_to :video_class, index: true
    end
  end
end