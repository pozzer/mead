class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    binding.pry
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :first_name, :profile => [:first_name, :birth_date])
  end

  def account_update_params
  	binding.pry
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :profile => [:first_name, :birth_date])
  end
end
