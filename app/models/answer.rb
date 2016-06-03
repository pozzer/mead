class Answer < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
	belongs_to :user
	belongs_to :question

  scope :the_best, -> { where(:best => true) }
  scope :remaining, -> { joins("LEFT JOIN rs_reputations ON answers.id = rs_reputations.target_id AND rs_reputations.target_type = 'Answer' AND rs_reputations.reputation_name = 'votes' AND rs_reputations.active = 't'").where(:best => false).order("rs_reputations.value DESC") }

  has_reputation :votes,
      source: :user,
      aggregated_by: :sum

  has_reputation :best_votes,
      source: :user,
      aggregated_by: :sum

  def voted_the_best
    self.update_attributes(best: true) if !self.question.have_best_answer?
  end

  def creator?(user_id)
    user_id == self.user_id
  end

  def can_edit?(user_id)
    ((Time.now - created_at ) < 5.minutes) and creator?(user_id)
  end
end
