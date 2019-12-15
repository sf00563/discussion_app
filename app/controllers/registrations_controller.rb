class RegistrationsController < Devise::RegistrationsController

  #Wanted to add a name to devise aswell, this allows name to be saved to user model
  private

  def sign_up_params
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :current_password)
  end
end
