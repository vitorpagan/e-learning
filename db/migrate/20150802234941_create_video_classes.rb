class CreateVideoClasses < ActiveRecord::Migration
  def change
    create_table :video_classes do |t|
      t.string :title
      t.string :excerpt
      t.string :description
      t.integer :duration
      t.integer :order

      t.timestamps null: false
    end
  end
end
