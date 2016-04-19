class ShoppingCartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shopping_cart_item, only: :destroy

  def destroy
    @shopping_cart_item.destroy
    redirect_to shopping_cart_url#, notice: 'Item removido com sucesso do carrinho.'
  end

  def add
    if(params[:type] == 'video_class')
      shopping_cart_item = ShoppingCartItem.new(video_class: VideoClass.friendly.find(params[:item_id]))
    else
      shopping_cart_item = ShoppingCartItem.new(course: Course.friendly.find(params[:item_id]))
    end
    current_user.shopping_cart.shopping_cart_items << shopping_cart_item
    redirect_to shopping_cart_url#, notice: 'Item adicionado com sucesso ao carrinho.'
  end

  private
  def set_shopping_cart_item
    @shopping_cart_item = ShoppingCartItem.find(params[:id])
  end
end