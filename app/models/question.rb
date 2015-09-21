class Question < ActiveRecord::Base
	has_many :answers
	belongs_to :user

	has_reputation :votes,
      :source => :user
end