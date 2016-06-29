class ConceptUser < ActiveRecord::Base
	##########MEAD########
	belongs_to :user
	belongs_to :concept

	def self.create_concepts(concepts, user)
		concepts.each do |concept|
			ConceptUser.find_or_create(concept, user)			
		end
	end

	def self.find_or_create(concept,user)
		ConceptUser.where(concept: concept, user: user).first || ConceptUser.create({user: user, concept: concept})
	end

	def self.get_user_best_to_answer(concepts)
		users = ConceptUser.where(concept: concepts).map(&:user)
		
		if users
			freq = users.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
			return  users.max_by { |v| freq[v] }
		else
			return nil
		end
	end

end