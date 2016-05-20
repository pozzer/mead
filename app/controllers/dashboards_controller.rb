class DashboardsController < ApplicationController
	before_filter :authenticate_user!
	def index
		@top_user = Answer.select("answers.user_id, count(answers)").the_best.group(:user_id).order("count(answers) DESC").first.user
		begin
			@time_line_pobre = [current_user.friends.map(&:questions).flatten!, current_user.friends.map(&:answers).flatten!].flatten!.sort_by{|e| e[:created_at]}
		rescue
			@time_line_pobre = []
		end
	end

end
