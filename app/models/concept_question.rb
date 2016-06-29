class ConceptQuestion < ActiveRecord::Base
	##########MEAD########
	belongs_to :question
	belongs_to :concept
	belongs_to :parent_concept, class_name: "Concept"

	def self.create_tree(concepts, question)
		concepts.each_with_index do |concept|
			ConceptQuestion.create({
				question: question,
				concept: concept,
			})
		end
	end

end