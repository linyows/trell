require 'trell/version'
require 'trell/client'

module Trell
  class << self
    include Trell::Configurable

    def client
      unless defined?(@client) && @client.same_options?(options)
        @client = Trell::Client.new(options)
      end
      @client
    end

    private

    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end
  end
end

Trell.setup
