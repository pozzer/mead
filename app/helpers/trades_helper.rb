module TradesHelper

	def get_bg_color_for_status(status)
		case status
		when "finished"
		  "bg-success"
		when "canceled"
		  "bg-danger"
		else
		  "bg-info"
		end
	end

	def get_title_accept(status)
		case status
		when "started"
			"Aceitar negociação"
		when "in_progress"
			"Finalizar proposta"
		when "awaiting_finalization"
			"Aceitar proposta"
		when "waiting_to_be_sent"
			"Garrafa(s) Recebida"
		else
			"Finalizar negociação"
		end
	end

	def get_title_cancel(status)
		case status
		when "started"
			"Cancelar negociação"
		when "awaiting_finalization"
			"Cancelar proposta"
		else
			"Finalizar negociação"
		end
	end

	def get_path_accept(trade)
		case trade.status
		when "started"
			trade_accept_path(trade_id:trade.id)
		when "in_progress"
			trade_close_proposal_path(trade_id:trade.id)
		when "awaiting_finalization"
			trade_accept_proposal_path(trade_id:trade.id)
		when "waiting_to_be_sent"
			trade_received_path(trade_id:trade.id)
		else
			"#finalziar"
		end
	end

	def get_path_cancel(trade)
		case trade.status
		when "started"
			trade_cancel_path(trade_id:trade.id)
		when "awaiting_finalization"
			trade_cancel_proposal_path(trade_id:trade.id)
		else
			"#finalziar"
		end
	end

	def add_status_block(status, icon="fa fa-check", text_color="text-success", bg_color="bg-success-light")
  	render partial: "trades/block_status", locals: { status: status, icon: icon, text_color: text_color, bg_color: bg_color}
	end

	def first_block(trade)
		case trade.status
		when "canceled"
			add_status_block("Inicializada", "fa fa-times", "text-muted", "bg-gray-lighter")
		else
			add_status_block("Inicializada")
		end
	end

	def second_block(trade)
		case trade.status
		when "started"
			add_status_block("Aguardando Aceitação", "si si-settings fa-spin", "text-warning", "bg-warning-light")
		when "canceled"
			add_status_block("Aceita", "fa fa-times", "text-muted", "bg-gray-lighter")
		else
			add_status_block("Aceita")
		end
	end

	def third_block(trade)
		case trade.status
		when "started", "canceled"
			add_status_block("Em negociação", "fa fa-times", "text-muted", "bg-gray-lighter")
		when "finished"
			add_status_block("Em negociação")
		else
			add_status_block("Em negociação", "si si-settings fa-spin", "text-warning", "bg-warning-light")
		end
	end

	def last_block(trade)
		case trade.status
		when "finished"
			add_status_block("Aceita")
		when "canceled"
			add_status_block("Cancelada", "fa fa-times", "text-danger", "bg-danger-light")
		else
			add_status_block("Finalizada", "fa fa-times", "text-muted", "bg-gray-lighter")
		end
	end

	def can_remove_bottle?(user, status)
		user == current_user and ["started", "accepted", "in_progress"].include?(status)
	end


end
