class Trade < ActiveRecord::Base
	has_many :messages, class_name: "MessageTrade"
	belongs_to :negotiator, class_name: "User"
	belongs_to :negotiant, class_name: "User"
	
	STATUS = {
		1 => "pendente",
		2 => "pendente",
		3 => "pendente"
	}

end