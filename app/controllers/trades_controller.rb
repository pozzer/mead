class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  before_action :mount_trade_params, only: :create

  def index
    @trades = Trade.all
  end

  def show
  end

  def new
    @trade = Trade.new
  end

  def edit
  end

  def create
    binding.pry
    @trade = Trade.new(trade_params)
    @trade.save
    respond_with(@btrade, :location => trades_path(@trade))
  end

  def update
    @trade.update_attributes(bottle_params)
    respond_with(@btrade, :location => trades_path(@trade))
  end

  def destroy
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to trades_url, notice: 'Trade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_trade
      @trade = Trade.find(params[:id])
    end

    def mount_trade_params
      get_bottle
      params[:trade] = {negotiant_id: @bottle.user_id, negotiator_id: current_user.id}
    end

    def trade_params
      params[:trade].permit(:negotiant_id, :negotiator_id)
    end

    def get_bottle
      @bottle = Bottle.find(params["bottle_id"].first)
    end
end
