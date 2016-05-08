class TradesController < AppController
  before_action :set_trade, only: [:show, :edit, :update, :destroy, :cancel, :accept, :close_proposal, :cancel_proposal, :accept_proposal, :received]
  before_action :check_address, only: [:close_proposal, :accept_proposal]
  before_action :check_trade_involving, only: :create
  respond_to :js, only: [:index]

  def index
    @trades_in_progress = Trade.involving(current_user).open.page(params[:trades_in_progress])
    @trades_canceled = Trade.involving(current_user).canceled.page(params[:trades_canceled])
    @trades_finalized = Trade.involving(current_user).finished.page(params[:trades_finalized])
  end

  def show
  end

  def create
    get_bottle
    mount_trade_params
    unless @trade
      @trade = Trade.new(trade_params)
      @trade.save
      Log.create({user: current_user, trade: @trade, status: 1, log_type: 1, message: "Solicitou a negociação"})
    end
    BottleTrade.add_or_create(@trade, @bottle.user, @bottle)
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
    Log.create({user: current_user, trade: @trade, status: 3, log_type: 5, message: "Cancelou a negociação"}) if @success
    redirect_to :back, :flash => (@success) ?  { :notice => "Troca cancelada com sucesso!" } : { :error => "Você não pode cancelar essa troca." }
  end

  def accept
    @success = @trade.accept! if @trade.can_accept?(current_user)
    Log.create({user: current_user, trade: @trade, status: 1, log_type: 2, message: "Aceitou a negociação"}) if @success
    redirect_to :back, :flash => (@success) ?  { :notice => "Troca aceita com sucesso!" } : { :error => "Você não pode aceitar essa troca." }
  end
  
  def close_proposal
    @success = @trade.close_proposal! if @trade.can_close_proposal?(current_user)
    Log.create({user: current_user, trade: @trade, status: 1, log_type: 7, message: "Fechou a proposta"}) if @success
    redirect_to :back, :flash => (@success) ?  { :notice => "Proposta fechada com sucesso!" } : { :error => "Você não pode fechar essa proposta." }
  end

  def accept_proposal
    @success = @trade.accept_proposal! if @trade.can_accept_proposal?(current_user)
    Log.create({user: current_user, trade: @trade, status: 1, log_type: 8, message: "Aceitou a proposta"}) if @success
    redirect_to :back, :flash => (@success) ?  { :notice => "Proposta cancelada com sucesso!" } : { :error => "Você não pode cancelar essa proposta." }
  end

  def cancel_proposal
    @success = @trade.cancel_proposal! if @trade.can_cancel_proposal?(current_user)
    Log.create({user: current_user, trade: @trade, status: 3, log_type: 9, message: "Cancelou a proposta"}) if @success
    redirect_to :back, :flash => (@success) ?  { :notice => "Proposta aceita com sucesso!" } : { :error => "Você não pode aceitar essa proposta." }
  end

  def received
    @success = @trade.received!(current_user)
    redirect_to :back, :flash => (@success) ?  { :notice => "Entrega recebida com sucesso!" } : { :error => "Você não alterar essa troca." }
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

    def check_address
      if current_user.profile.address.blank?
        redirect_to edit_profile_path(current_user.profile), :flash => { :error => "Por favor preencha seu endereço!" }
      end
    end
end
