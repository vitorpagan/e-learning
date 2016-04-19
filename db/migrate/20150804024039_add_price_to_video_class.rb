class AddPriceToVideoClass < ActiveRecord::Migration
  def change
    add_column :video_classes, :price, :decimal, default: 0
  end
end
