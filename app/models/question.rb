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

  scope :newer, -> { order("questions.created_at DESC")}

  scope :joins_search, -> { top_rated.joins("INNER JOIN users ON users.id = questions.user_id
                                   INNER JOIN profiles ON users.id = profiles.user_id
                                   LEFT JOIN answers ON answers.question_id = questions.id") }
  scope :joins_for_union,-> { top_rated }
  scope :top_rated, -> { find_with_reputation(:votes, :all).order("votes DESC") }

  paginates_per 20

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

  def self.columns_search
    ["questions.title", "answers.content", "questions.content",
    "profiles.first_name || ' ' || profiles.last_name"]
  end


end
