class Notification < ActiveRecord::Base
	belongs_to :user
  belongs_to :trackable, :polymorphic => true

  scope :not_read, -> { where(read: false) }
end
