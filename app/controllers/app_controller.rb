class AppController < ApplicationController
  include Breadcrumbs
  before_filter :authenticate_user!, :set_breadcrumbs

  private

    def require_login
      unless current_user
        redirect_to user_session_path
      end
    end

end
