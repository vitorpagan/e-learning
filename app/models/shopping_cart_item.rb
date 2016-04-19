class ShoppingCartItem < ActiveRecord::Base
  belongs_to :shopping_cart
  belongs_to :course
  belongs_to :video_class
end
