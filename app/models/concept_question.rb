class ConceptQuestion < ActiveRecord::Base
	##########MEAD########
	belongs_to :question
	belongs_to :concept
	belongs_to :parent_concept, class_name: "Concept"

	def self.create_tree(concepts, question)
		concepts.each_with_index do |concept, index|
			ConceptQuestion.create({
				question: question
				concept: concept
				parent_concept: (index > 0 ? concepts[index-1] : nil)
			})
		end
	end

end