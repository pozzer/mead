class Rating < ActiveRecord::Base
	belongs_to :user
  belongs_to :rateable, :polymorphic => true

  has_reputation :commend,
      source: :user,
      aggregated_by: :sum
      
end
