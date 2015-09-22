class Profile < ActiveRecord::Base
	has_many :pictures, :as => :attachable, :dependent => :destroy
	belongs_to :user
	belongs_to :city

	acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tags
end