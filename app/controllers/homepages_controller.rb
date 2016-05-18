class HomepagesController < ApplicationController
	layout "website"
	skip_before_filter :authenticate_user!
	before_filter :check_dashboard
	
	def index
	end

	def check_dashboard
		if current_user
			redirect_to dashboards_path
		end
	end
end
