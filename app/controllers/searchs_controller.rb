class SearchsController < ApplicationController

	def index
		@questions = MonsterSearch.new(Question, params[:search]).search.page(params[:question_page])
		@profiles = MonsterSearch.new(Profile, params[:search]).search.page(params[:profile_page])
		@bottles = MonsterSearch.new(Bottle, params[:search]).search.page(params[:bottle_page])
	end

end
