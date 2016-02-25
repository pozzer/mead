class Trade < ActiveRecord::Base
	has_many :messages, class_name: "MessageTrade"
	has_many :bottle_trades
  belongs_to :negotiator, class_name: "User"
	belongs_to :negotiant, class_name: "User"

  validates_presence_of :negotiator, :negotiant

  accepts_nested_attributes_for :bottle_trades, :allow_destroy => true

  enum status: {general: 0, post_received: 1, put_received: 2, post_sended: 3, put_sended: 4}

end
