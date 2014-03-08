module Trell
  module Authentication
    def generation_endpoint
      @api_endpoint.gsub('api.', '')
    end

    def key_generetor
      "#{generation_endpoint}appKey/generate"
    end

    def token_generator(expiration = 'never', scope = 'read,write,account')
      query = [
        "response_type=token",
        "key=#{@application_key}",
        "scope=#{scope}",
        "expiration=#{expiration}",
        "name=Trell"
      ].join('&')

      "#{generation_endpoint}authorize?#{query}"
    end

    def basic_authenticated?
      !!(@login && @password)
    end

    def token_authenticated?
      !!@access_token
    end

    def user_authenticated?
      basic_authenticated? || token_authenticated?
    end

    def application_authenticated?
      !!application_authentication
    end

    private

    def application_authentication
      if @application_key && @application_token
        {
          key: @application_key,
          token: @application_token
        }
      end
    end
  end
end
