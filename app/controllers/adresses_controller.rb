class AdressesController < ApplicationController

	def search_postal_code
    begin
      address = get_address
      render :json => address.to_json
    rescue SocketError,RuntimeError, Timeout::Error
      address = {'bairro' => '','cep' => '','cidade' => '','logradouro' => '','tipo_logradouro' => '','uf' => '1'}
      render :json => address.to_json
    end
  end
  
  def get_address
    address = {}
    address_correios = Correios::CEP::AddressFinder.get(params[:postal_code])
    return raise RuntimeError if address_correios.nil? or address_correios.blank?
    address[:cidade_nome] = address_correios[:city]
    address[:cidade] = City.find_or_create_by_nome(address_correios[:city], address_correios[:state]).id
    address[:uf] = State.find_by_symbol(address_correios[:state]).id
    address[:cep] = address_correios[:zipcode]
    address[:logradouro] = address_correios[:address]
    address[:bairro] = address_correios[:neighborhood]

    address
  end

  def get_cities_by_symbol
    cities =  City.from_state_state_symbol(params[:symbol])
    render :json => cities.collect{|x| "<option value='#{x.id}'>#{x.name}</option>"}.to_json
  end

end

