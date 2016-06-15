class FavoriteQuestion < ActiveRecord::Base
  include PublicActivity::Model
  include PublicActivity::Model
  tracked :owner => proc {|controller, model| controller.current_user}, # set owner to current_user by default (check app/controllers/application_controller.rb)
          :params => {
            :question_id => proc {|controller, model| model.question.id}
          }
	belongs_to :question
	belongs_to :user

	default_scope -> { includes(:question) }

	paginates_per 20
  
end
