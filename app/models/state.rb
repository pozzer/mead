class State < ActiveRecord::Base
  has_many :cities
  
  validates :name, :presence=>true

	default_scope { order('name ASC') }
end
