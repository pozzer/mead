class MessageTrade < ActiveRecord::Base
	belongs_to :user
	belongs_to :trade
end
