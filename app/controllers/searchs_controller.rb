class SearchsController < ApplicationController

	def index
		@profiles = MonsterSearch.new(Profile, params[:search]).search.page(params[:profile_page])
		@questions = []
		@bottles = []
	end

end
