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

  acts_as_taggable

  validates :title, presence: true
  validates :content, presence: true

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
