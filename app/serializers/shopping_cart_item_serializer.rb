class ShoppingCartItemSerializer < ActiveModel::Serializer
  has_one :video_class
  has_one :course
  has_one :shopping_cart
end