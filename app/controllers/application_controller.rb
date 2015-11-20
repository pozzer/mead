class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery with: :exception

  private

	  def require_login
	    unless current_user
	      redirect_to user_session_path
	    end
	  end

	  # Overwriting the sign_out redirect path method
	  def after_sign_out_path_for(resource_or_scope)
	  	root_path
	  end

end
