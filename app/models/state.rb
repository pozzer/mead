class State < ActiveRecord::Base
	has_many :cities, class_name: "City" 
end
