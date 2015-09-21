class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question

	has_reputation :avg_rating,
      :source => :user,
      :aggregated_by => :average,
      :source_of => [{ :reputation => :answering_skill, :of => :author }]
end
