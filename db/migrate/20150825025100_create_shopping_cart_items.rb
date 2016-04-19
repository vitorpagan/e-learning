class CreateShoppingCartItems < ActiveRecord::Migration
  def change
    create_table :shopping_cart_items do |t|
      t.references :shopping_cart, index: true
      t.references :course, index: true
      t.references :video_class, index: true

      t.timestamps null: false
    end
    add_foreign_key :shopping_cart_items, :shopping_carts
    add_foreign_key :shopping_cart_items, :courses
    add_foreign_key :shopping_cart_items, :video_classes
  end
end
