class Log < ActiveRecord::Base
  belongs_to :trade
  belongs_to :user

  enum status: {success: 1, warning: 2, danger: 3}
  enum log_type: {started: 1, accepted: 2, awaiting_finalization: 3, finished: 4, canceled: 5, proposal: 6, close_proposal: 7, accept_proposal: 8, cancel_proposal: 9, received: 10}

  default_scope -> { order("created_at DESC") }

  validates :log_type, :status, :user_id, :trade_id, presence: true

  def log_type_to_s
    I18n.t :"activerecord.attributes.log.log_types.#{log_type}"
  end

end
