class Question < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :answers
	has_many :favorite_questions
	belongs_to :user

	has_reputation :votes,
      source: :user,
      aggregated_by: :sum

  has_reputation :favorite_question,
      source: :user,
      aggregated_by: :sum

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tags

  validates :title, presence: true
  validates :content, presence: true

  #def to_param
  #  [id, title.parameterize].join("-")
  #end

  def have_best_answer?
    answers.the_best.any?
  end

  def answers_list
    answers.the_best + answers.remaining
  end

  def favorite_count
    favorite_questions.size
  end

  def votes_count
    reputation_for(:votes).to_i
  end

end
