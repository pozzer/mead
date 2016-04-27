class Trade < ActiveRecord::Base
	has_many :messages, class_name: "MessageTrade"
	has_many :bottle_trades
  belongs_to :negotiator, class_name: "User"
	belongs_to :negotiant, class_name: "User"

  validates_presence_of :negotiator, :negotiant, :status

  accepts_nested_attributes_for :bottle_trades, :allow_destroy => true

  enum status: {started: 0, accepted: 1, in_progress: 2, awaiting_finalization: 3, finished: 4}



end
