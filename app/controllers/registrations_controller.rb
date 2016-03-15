class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(resource_name).permit(:email, :password, :password_confirmation, :current_password, :terms, :profile_attributes => [:first_name, :birth_date ])
  end
end
