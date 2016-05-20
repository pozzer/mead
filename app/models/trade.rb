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

  scope :open, -> { where(status: Trade.status_opened_to_i ) }

  scope :suggest_bottles, -> (user) do
    joins(:bottle_trades).where("trades.owner_id =?", user.id)
  end

  paginates_per 15

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

  def cancel_proposal!
    self.update_attribute(:status, 2)
  end

  def can_cancel_proposal?(user)
    belongs?(user) and !user_close_proposal?(user) and status == "awaiting_finalization"
  end

  def accept_proposal!
    self.update_attribute(:status, 4)
  end

  def can_accept_proposal?(user)
    can_cancel_proposal?(user)
  end

  def close_proposal!
    self.update_attribute(:status, 3)
  end

  def can_close_proposal?(current_user)
    belongs?(current_user) and status == "in_progress"
  end

  def accept!
    self.update_attribute(:status, 2)
  end

  def can_cancel?(user)
    belongs?(user) and Trade.status_opened.include?(status)
  end

  def can_accept?(user)
    belongs?(user) and user_requested?(user) and status == "started"
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

  def can_received?(user)
    belongs?(user) and status == "waiting_to_be_sent"
  end

  def received!(user)
    if can_received?(user)
      case receiveds.size
      when 0
        Log.create({user: user, trade: self, status: 1, log_type: 10, message: "Recebeu a(s) Garrafa(s)"})
        return true
      when 1
        unless user_received_proposal?(user)
          self.update_attribute(:status, 5)
          Log.create({user: user, trade: self, status: 1, log_type: 10, message: "Recebeu a(s) Garrafa(s)"})
          Log.create({user: user, trade: self, status: 1, log_type: 4, message: "Finalizou a entrega)"})
          return true
        end
      end
    end
    return false
  end

  def self.status_opened
    ["started", "accepted", "in_progress", "awaiting_finalization", "waiting_to_be_sent"]
  end

  def self.status_opened_to_i
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

  def user_close_proposal
    logs.close_proposal.last.try(:user)
  end

  def user_close_proposal?(user)
    user_close_proposal == user
  end

  def receiveds
    logs.received
  end

  def user_received_proposal?(user)
    receiveds.map(&:user).include?(user)
  end

end
