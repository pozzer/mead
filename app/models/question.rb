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

  scope :without_best_answer, -> { where("questions.id not IN ( select answers.question_id from answers where answers.question_id = questions.id and answers.best = 't' )") }

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
