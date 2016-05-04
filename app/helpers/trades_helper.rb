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
		when 0
			"Aceitar negociação"
		else
			"Finalizar negociação"
		end
	end

	def get_path_accept(trade)
		case trade.status.to_i
		when 0
			trade_accept_path(trade_id:trade.id)
		else
			"#finalziar"
		end
	end
end
