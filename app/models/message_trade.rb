class MessageTrade < ActiveRecord::Base
	belongs_to :user
	belongs_to :trade
	
	default_scope -> { order("created_at ASC") }

	def group_by_criteria
  	created_at.to_date.to_s(:db)
	end

	def can_send?(current_user)
		trade.belongs?(current_user) and !content.blank?
	end
end
