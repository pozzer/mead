class BottleTrade < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	belongs_to :trade
	belongs_to :bottle

  def can_add?
		trade.belongs?(owner) and bottle.amount > 0 and bottle.user = owner and trade.open?
	end

	def can_remove?(user)
		trade.belongs?(user) and bottle.user = user and trade.open?
	end
	def self.add_or_create(trade, owner, bottle)
    bottle_trade = BottleTrade.where(trade: trade, owner: owner, bottle: bottle).first
    bottle_trade ||= BottleTrade.new({trade: trade, owner: owner, bottle: bottle, amount: 0})
    if bottle_trade.can_add?
	    bottle_trade.amount = bottle_trade.amount + 1
	    bottle.amount = bottle.amount - 1
    	bottle.save if bottle_trade.save
    end
    !bottle_trade.new_record?
  end

  def remove_or_destroy(user)
    if can_remove?(user)
	    self.amount = self.amount - 1
	    bott = self.bottle
	    bott.amount = bott.amount + 1
	    if self.amount < 1
	    	self.destroy
	    else
	    	self.save
	    end
	    return bott.save
    end
    return false
  end

end
