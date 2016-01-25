class FavoriteQuestion < ActiveRecord::Base
	belongs_to :question
	belongs_to :user

	default_scope -> { includes(:question) }
end
