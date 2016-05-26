class DashboardsController < ApplicationController
	before_filter :authenticate_user!
	def index
		#@top_user = Answer.select("answers.user_id, count(answers)").the_best.group(:user_id).order("count(answers) DESC").first.user
		@top_users = User.find_with_reputation(:experience, :all).order("experience desc").first(5)
		@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.friend_ids, owner_type: "User").last(6)
		@questions = Question.order("created_at asc").last(6).reverse
		@bottles = Bottle.publics.order("created_at asc").last(5).reverse
		@profiles = Profile.order("created_at asc").last(5).reverse

	end


end

