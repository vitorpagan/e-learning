class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :manage_shopping_cart
  layout 'application'

  def manage_shopping_cart
    if current_user
      shopping_cart = ShoppingCart.where(user: current_user).order(created_at: :desc).first
      unless shopping_cart
        shopping_cart = ShoppingCart.create(user: current_user)
      end
    end
  end
end
