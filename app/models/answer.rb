class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question

  scope :the_best, -> { where(:best => true) }
  scope :remaining, -> { joins("LEFT JOIN rs_reputations ON answers.id = rs_reputations.target_id AND rs_reputations.target_type = 'Answer' AND rs_reputations.reputation_name = 'votes' AND rs_reputations.active = 't'").where(:best => false).order("rs_reputations.value DESC") }

  has_reputation :votes,
      source: :user,
      aggregated_by: :sum
end
