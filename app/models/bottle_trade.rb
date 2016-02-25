class BottleTrade < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	belongs_to :trade
	belongs_to :bottle

end
