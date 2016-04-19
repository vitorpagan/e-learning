class AddOrderToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :order_number, :integer
  end
end
