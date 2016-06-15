class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  scope :not_read, -> { where(read: false) }
end
