class TradesController < AppController
  before_action :set_trade, only: [:show, :edit, :update, :destroy, :cancel]
  before_action :check_trade_involving, only: :create
  respond_to :js, only: [:index]

  def index
    @trades_in_progress = Trade.involving(current_user).open.page(params[:trades_in_progress])
    @trades_canceled = Trade.involving(current_user).canceled.page(params[:trades_canceled])
    @trades_finalized = Trade.involving(current_user).finished.page(params[:trades_finalized])
  end

  def show
  end

  def new
    @trade = Trade.new
  end

  def edit
  end

  def create
    get_bottle
    mount_trade_params
    unless @trade 
      @trade = Trade.new(trade_params)
      @trade.save
    end
    add_or_create_bottle_trade
    respond_with(@trade)
  end

  def update
    @trade.update_attributes(bottle_params)
    respond_with(@trade)
  end

  def destroy
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to trades_url, notice: 'Trade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def cancel
    @success = @trade.cancel! if @trade.can_cancel?(current_user)
    redirect_to :back, :flash => (@success) ?  { :notice => "Troca cancelada com sucesso!" } : { :error => "Você não pode cancelar essa troca." }
  end

  def accept
    @success = @trade.accept! if @trade.can_accept?(current_user)
    redirect_to :back, :flash => (@success) ?  { :notice => "Troca aceita com sucesso!" } : { :error => "Você não pode aceitar essa troca." }
  end

  private
    def set_trade
      @trade = Trade.find(params[:id] || params[:trade_id])
    end

    def mount_trade_params
      params[:trade] = {negotiant_id: @bottle.user_id, negotiator_id: current_user.id, status: 0}
    end

    def trade_params
      params[:trade].permit(:negotiant_id, :negotiator_id, :status)
    end

    def get_bottle
      @bottle ||= Bottle.find(params["bottle_id"].first)
    end

    def check_trade_involving 
      get_bottle
      @trade = Trade.our_trades(current_user, @bottle.user).open.first
    end

    def add_or_create_bottle_trade
      @bottle_trade = BottleTrade.where(trade_id: @trade.id, owner_id: @current_user.id, bottle_id: @bottle.id).first
      @bottle_trade ||= BottleTrade.new({trade_id: @trade.id, owner_id: @current_user.id, bottle_id: @bottle.id, amount: 0})
      @bottle_trade.amount = @bottle_trade.amount + 1
      @bottle_trade.save
      @bottle_trade
    end
end
