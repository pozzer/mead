class Question < ActiveRecord::Base
	has_many :answers
	has_many :favorite_questions
	belongs_to :user

	has_reputation :votes,
      :source => :user

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tags

  validates :title, presence: true
  validates :content, presence: true

  def to_param
    [id, title.parameterize].join("-")
  end

end
