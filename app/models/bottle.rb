class Bottle < ActiveRecord::Base
	has_many :pictures, :as => :attachable, :dependent => :destroy
	has_many :bottle_trades
	belongs_to :user

	acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tags

end