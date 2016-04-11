module ProfilesHelper

	def options_for_cities(object)
		cities = object.state.nil? ? City.from_state_state_symbol("AC") : object.state.cities
		return cities.collect{|x| [x.name, x.id]}
	end

end
