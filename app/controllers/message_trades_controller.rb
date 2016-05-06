class MessageTradesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_trade, only: [:create]

  def create
    @message = @trade.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save! if @message.can_send?(current_user)
    respond_to do |format|
      format.html { redirect_to trade_path(@trade, anchor: "chat"), notice: 'Mensagem enviada com successo.' }
    end
  end

  private

  def set_trade
    @trade = Trade.find(params[:trade_id])
  end

  def message_params
    params.require(:message_trade).permit(:content)
  end
end