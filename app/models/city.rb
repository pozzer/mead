class City < ActiveRecord::Base
	
	belongs_to :state
	has_many :profiles

	validates :name, :presence=>true
	
	scope :from_state, lambda {|state_id| joins(:state).where(:"states.id" => state_id) }
	scope :from_state_state_symbol, lambda {|state_symbol| joins(:state).where(:"states.symbol" => state_symbol) }

	default_scope { order('cities.name ASC') }

	def to_s
		self.name
	end

	def self.find_or_create_by_nome(name, symbol)
  	city = City.where("name ilike '%#{name}%'").first
  	if city.nil?
  		state = State.where(symbol: symbol).first
  		city = City.create! name: name, state: state
  	end
  	city
  end

end