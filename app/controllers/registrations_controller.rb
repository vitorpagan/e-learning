class RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
    @user.address = Address.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user, bypass: true
      redirect_to home_url, notice: 'Usuário cadastrado com sucesso. Bem-vindo!'
    else
      if params[:social].present?
        render :new_facebook
      else
        render :new
      end
    end
  end

  def update
    if @user.update(user_params)
      redirect_to new_user_session_path, notice: t(".notice")
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to new_user_session_path, notice: 'User was successfully destroyed.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :uid, :image,
      address_attributes: [:zipcode, :address, :number, :district, :city, :state, :country])
  end
end
