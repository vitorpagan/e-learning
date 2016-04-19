class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :shopping_cart, index: true
      t.integer :status
      t.integer :payment_method_id
      t.string :order_id

      t.timestamps null: false
    end
    add_foreign_key :orders, :shopping_carts
  end
end
