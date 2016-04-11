class FavoriteQuestion < ActiveRecord::Base
	belongs_to :question
	belongs_to :user

	default_scope -> { includes(:question) }

	paginates_per 1
end
