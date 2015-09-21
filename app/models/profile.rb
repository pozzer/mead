class Profile < ActiveRecord::Base
	has_many :pictures, :as => :attachable, :dependent => :destroy
	belongs_to :user
	belongs_to :city
end