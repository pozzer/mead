class Bottle < ActiveRecord::Base
	has_many :pictures, :as => :attachable, :dependent => :destroy
	has_many :bottle_trades
	belongs_to :user
end