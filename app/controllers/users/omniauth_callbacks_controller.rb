class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    auth_params = request.env["omniauth.auth"]
    unless auth_params.info.email.blank?
      @user = User.find_for_facebook_oauth(auth_params, current_user)
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
        return sign_in_and_redirect @user, :event => :authentication
      end
    end
    session["devise.facebook_data"] = auth_params
    return redirect_to new_user_registration_url
  end

end
