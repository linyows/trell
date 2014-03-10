require 'trell/response/raise_error'

module Trell
  module Configurable
    OPTIONS_KEYS = %i(
      login
      password
      application_key
      application_token
      api_endpoint
      web_endpoint
      user_agent
      media_type
    )

    attr_accessor(*OPTIONS_KEYS)

    class << self
      def keys
        @keys ||= OPTIONS_KEYS
      end
    end

    def configure
      yield self
    end

    def reset!
      @login              = ENV['TRELL_LOGIN']
      @password           = ENV['TRELL_PASSWORD']
      @application_key    = ENV['TRELL_APPLICATION_TOKEN']
      @application_secret = ENV['TRELL_APPLICATION_SECRET']
      @api_endpoint       = ENV['TRELL_API_ENDPOINT'] || 'https://api.trello.com/1/'
      @web_endpoint       = ENV['TRELL_WEB_ENDPOINT'] || 'https://trello.com/'
      @user_agent         = "Trell Ruby Gem #{Trell::VERSION}"
      @media_type         = 'application/json'
      self
    end
    alias setup reset!

    private

    def options
      Hash[Trell::Configurable.keys.map { |key|
        [key, instance_variable_get(:"@#{key}")]
      }]
    end
  end
end
