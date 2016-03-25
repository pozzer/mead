require File.expand_path('../boot', __FILE__)
ENV['RANSACK_FORM_BUILDER'] = '::SimpleForm::FormBuilder'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MeadProject
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Brasilia'
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.available_locales = :'pt-BR'
    config.i18n.default_locale = :'pt-BR'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml')]
    config.assets.paths << "#{Rails.root}/app/assets/fonts"

    config.less.compress = true
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end

  def search_postal_code
    begin
      address = get_address
      render :json => address.to_json
    rescue SocketError,RuntimeError, Timeout::Error
      address = {'bairro' => '','cep' => '','cidade' => '','logradouro' => '','tipo_logradouro' => '','uf' => ''}
      render :json => address.to_json
    end
  end
  
  def get_address
    address = {}
    address_correios = Correios::CEP::AddressFinder.get(params[:cep])
    return raise RuntimeError if address_correios.nil? or address_correios.blank?
    address[:cidade_nome] = address_correios[:city]
    #address[:cidade] = City.find_or_create_by_nome(address_correios[:city], address_correios[:state]).id
    address[:uf] = address_correios[:state]
    address[:cep] = address_correios[:zipcode]
    address[:logradouro] = address_correios[:address]
    address[:bairro] = address_correios[:neighborhood]

    endereco
  end
end
