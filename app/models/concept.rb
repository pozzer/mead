class Concept < ActiveRecord::Base

	def self.find_or_create(val)
  	Concept.where(val: val).first || Concept.create(val: val)

  end
	
end