class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  before_action :set_online
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    profile_path(current_user.profile)
  end

	def all_signed_in_in_touch
	  ids = []
	  $redis_onlines.scan_each( match: 'user*' ){|u| ids << u.gsub("user:", "") }
	  ids
	end

	def all_anonymous_in_touch
	  $redis_onlines.scan_each( match: 'ip*' ).to_a.size
	end

	def all_who_are_in_touch
	  $redis_onlines.dbsize
	end


	private


		def set_online
	    if !!current_user
	      $redis_onlines.set( "user:#{current_user.id}", nil, ex: 10*60 )
	    else
	      $redis_onlines.set( "ip:#{request.remote_ip}", nil, ex: 10*60 )
	    end
  	end
end
