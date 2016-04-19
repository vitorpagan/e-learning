class ShoppingCart < ActiveRecord::Base
  belongs_to :user
  has_many :shopping_cart_items, dependent: :destroy
  has_one :order, dependent: :destroy

  def total
    total = 0
    shopping_cart_items.each do |item|
      total = total + (item.course ? item.course.price : item.video_class.price)
    end
    total
  end

  def split?
    shopping_cart_items.each do |item|
      return true if item.course
    end
    false
  end
end