class Devise::SessionsController < DeviseController
  before_filter :clear_from_signed_in_touch, only: :destroy
  before_filter :clear_from_anonymous_in_touch, only: :create

  private

    def clear_from_anonymous_in_touch
      $redis_onlines.del( "ip:#{request.remote_ip}" )
    end

    def clear_from_signed_in_touch
      $redis_onlines.del( "user:#{session[:user_id]}" )
    end
end
  