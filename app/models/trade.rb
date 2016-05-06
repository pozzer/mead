class Trade < ActiveRecord::Base
	has_many :messages, class_name: "MessageTrade"
	has_many :bottle_trades
  has_many :logs
  belongs_to :negotiator, class_name: "User"
	belongs_to :negotiant, class_name: "User"

  validates_presence_of :negotiator, :negotiant, :status

  accepts_nested_attributes_for :bottle_trades, :allow_destroy => true

  enum status: {started: 0, accepted: 1, in_progress: 2, awaiting_finalization: 3, waiting_to_be_sent: 4, finished: 5, canceled: 9}

  scope :involving, -> (user) do
    where("(trades.negotiator_id =? OR trades.negotiant_id =?)", user.id, user.id)
  end

  scope :our_trades, -> (current_user, bottle_user) do
    where("(trades.negotiator_id =? OR trades.negotiant_id =?) AND (trades.negotiator_id =? OR trades.negotiant_id =?)", current_user.id, current_user.id, bottle_user.id, bottle_user.id)
  end

  scope :open, -> { where(status: Trade.status_opened ) }

  scope :suggest_bottles, -> (user) do
    joins(:bottle_trades).where("trades.owner_id =?", user.id)
  end

  paginates_per 1

  def suggest_bottles(user)
    self.bottle_trades.where("bottle_trades.owner_id =?", user.id)
  end

  def other_user(user)
  	negotiator == user ? negotiant : negotiator
  end

  def cancel!
    self.update_attributes({status: 9, finished_at: Time.now})
    bottle_trades.each do |bottle_trade|
      bottle = bottle_trade.bottle
      bottle.amount = bottle.amount + bottle_trade.amount
      bottle.save
    end
  end

  def accept!
    self.update_attribute(:status, 1)
  end

  def can_cancel?(user)
    belongs?(user) and Trade.status_opened.include?(status.to_i)
  end

  def can_accept?(user)
    belongs?(user) and user_requested?(user) and status.to_i == 0
  end

  def belongs?(user)
    negotiator == user || negotiant == user
  end

  def can_see?(user)
    belongs?(user)
  end

  def can_edit?(user)
    belongs?(user)
  end

  def self.status_opened
    [0, 1, 2, 3, 4]
  end

  def open?
    Trade.status_opened.include?(self.status)
  end

  def status_to_s
    I18n.t :"activerecord.attributes.trade.status.#{status}"
  end

  def user_started?(user)
    negotiator == user
  end

  def user_requested?(user)
    negotiant == user
  end

  def user_started
    negotiator_id?
  end

end
