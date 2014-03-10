require 'faraday'
require 'trell/error'

module Trell
  module Response
    class RaiseError < Faraday::Response::Middleware
      private

      def on_complete(response)
        if error = Trell::Error.from_response(response)
          raise error
        end
      end
    end
  end
end
