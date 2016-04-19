class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    oauth2_callback(:facebook)
  end

  private

  def oauth2_callback(provider)

    begin
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        sign_in @user
        redirect_to home_url
        flash[:notice] = I18n.t("devise.sessions.user.signed_in")
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        @user.address = Address.new
        render 'users/registrations/new_facebook'
      end

    rescue RuntimeError => e
      flash[:error] = I18n.t("devise.omniauth_callbacks.user.used_provider")
      redirect_to edit_user_path(current_user)
    end


  end

  def failure_message
    exception = env["omniauth.error"]
    error   = exception.error_reason if exception.respond_to?(:error_reason)
    error ||= exception.error        if exception.respond_to?(:error)
    error ||= env["omniauth.error.type"].to_s
    I18n.t("devise.omniauth_callbacks.user.#{error.to_s}") if error
  end

end
