class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    resource.build_profile({ first_name: session["devise.facebook_data"]["info"]["first_name"] }) unless session["devise.facebook_data"].blank?
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end

  private

  def sign_up_params
    binding.pry
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :first_name, :profile => [:first_name, :birth_date])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :profiles_attributes => [:first_name, :birth_date ]])
  end
end
