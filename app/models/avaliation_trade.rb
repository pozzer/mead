class AvaliationTrade < ActiveRecord::Base
	belongs_to :assessed, class_name: "User" 
	belongs_to :appraiser, class_name: "User"
	belongs_to :trade
	belongs_to :bottle
end