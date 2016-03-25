class SearchsController < ApplicationController

	def index
		@profiles = MonsterSearch.new(Profile, params[:search]).search
		@questions = []
		@bottles = []
	end

end
