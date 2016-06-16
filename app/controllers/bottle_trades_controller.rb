class BottleTradesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_bottle, only: [:add]
  before_action :set_trade, only: [:add, :remove]
  before_action :set_bottle_trade, only: [:remove]

  def add
    @success = BottleTrade.add_or_create(@trade, current_user, @bottle)
    if @success
      Log.create({user: current_user, trade: @trade, status: 1, log_type: 6, message: "Adicionou #{@bottle.to_s} na proposta"})
      Notification.create({user: @trade.other_user(current_user), trackable: @trade, key: "trade_add_bottle"})
    end

    respond_to do |format|
      format.html { redirect_to trade_path(@trade, anchor: "proposal"), notice: @success ? "Garrafa adicionada com successo." : "Você não pode adicionar essa garrafa."}
    end
  end

  def remove
    @bottle = @bottle_trade.bottle
    @success = @bottle_trade.remove_or_destroy(current_user)
    if @success
      Log.create({user: current_user, trade: @trade, status: 3, log_type: 6, message: "Removeu #{@bottle.to_s} da proposta"}) 
      Notification.create({user: @trade.other_user(current_user), trackable: @trade, key: "trade_remove_bottle"})
    end
    respond_to do |format|
      format.html { redirect_to trade_path(@trade, anchor: "proposal"), notice: @success ? "Garrafa removida com successo." : "Você não pode remover essa garrafa."}
    end
  end

  private

    def set_trade
      @trade = Trade.find(params[:trade_id])
    end

    def set_bottle_trade
      @bottle_trade = BottleTrade.find(params[:id])
    end

    def set_bottle
      @bottle = Bottle.find(params[:bottle_id])
    end

end
