class HomepagesController < ApplicationController
	layout "website"
	skip_before_filter :authenticate_user!

	def index
	end

	def login
	end

	def register
	end

end
