class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    if User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user).persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
    else
      @user = User.from_omniauth(auth)
    end
    sign_in_and_redirect @user, :event => :authentication
  end

  def auth
    ActionController::Parameters.new(request.env["omniauth.auth"]).permit(:provider, :uid, :info => [:email, :name, :first_name, :last_name, :image, :verified, :urls=> [:Facebook] ], :credentials => [:token, :expires_at, :expires], :extra => [:raw_info => [:id, :email, :first_name, :gender, :last_name, :link, :locale, :name, :timezone, :updated_time, :verified ]] )
  end

end
