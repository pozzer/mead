class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({:profile_attributes=>{first_name:"Feliphe"}})
    @profile = resource.build_profile({ first_name: session["devise.facebook_data"]["info"]["first_name"] }) unless session["devise.facebook_data"].blank?
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end

  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      @profile = resource.profile
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  def sign_up_params
    params.require(resource_name).permit(:email, :password, :password_confirmation, :current_password, :profile_attributes => [:first_name, :birth_date ])
  end
end
