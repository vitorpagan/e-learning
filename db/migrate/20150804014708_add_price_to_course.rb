class AddPriceToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :price, :decimal, default: 0
  end
end
