class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    profile_path(current_user.profile)
  end
end
