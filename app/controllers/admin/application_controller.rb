class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :validates_admin

  layout 'admin/application'

  private
  def validates_admin
    unless current_user.admin?
      redirect_to root_url
    end
  end
end
