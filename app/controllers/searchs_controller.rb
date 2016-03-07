class SearchsController < ApplicationController

	def index
		@questions = Question.all
		@profiles = Profile.all
		@bottles = Bottle.all
	end

end
