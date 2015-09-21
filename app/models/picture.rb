class Picture < ActiveRecord::Base
	belongs_to :attachable, :polymorphic => true
  belongs_to :user
end