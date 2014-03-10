module Trell
  class Error < StandardError
    def self.from_response(response)
      if klass = case response[:status].to_i
        when 400      then Trell::BadRequest
        when 401      then Trell::Unauthorized
        when 403      then Trell::Forbidden
        when 404      then Trell::NotFound
        when 406      then Trell::NotAcceptable
        when 409      then Trell::Conflict
        when 415      then Trell::UnsupportedMediaType
        when 422      then Trell::UnprocessableEntity
        when 400..499 then Trell::ClientError
        when 500      then Trell::InternalServerError
        when 501      then Trell::NotImplemented
        when 502      then Trell::BadGateway
        when 503      then Trell::ServiceUnavailable
        when 500..599 then Trell::ServerError
        end
        klass.new(response)
      end
    end

    def initialize(response = nil)
      @response = response
      super(build_error_message)
    end

    def errors
      if data && data.is_a?(Hash)
        data[:errors] || []
      else
        []
      end
    end

    private

    def data
      @data ||=
        if (body = @response[:body]) && !body.empty?
          if body.is_a?(String) &&
            @response[:response_headers] &&
            @response[:response_headers][:content_type] =~ /json/

            Sawyer::Agent.serializer.decode(body)
          else
            body
          end
        else
          nil
        end
    end

    def response_message
      case data
      when Hash
        data[:message]
      when String
        data
      end
    end

    def response_error
      "Error: #{data[:error]}" if data.is_a?(Hash) && data[:error]
    end

    def build_error_message
      return nil if @response.nil?

      message =  "#{@response[:method].to_s.upcase} "
      message << redact_url(@response[:url].to_s) + ": "
      message << "#{@response[:status]} - "
      message << "#{response_message}" unless response_message.nil?
      message << "#{response_error}" unless response_error.nil?
      message
    end

    def redact_url(url_string)
      %w[client_secret access_token].each do |token|
        url_string.gsub!(/#{token}=\S+/, "#{token}=(redacted)") if url_string.include? token
      end
      url_string
    end
  end

  class ClientError < Error; end
  class BadRequest < ClientError; end
  class Unauthorized < ClientError; end
  class Forbidden < ClientError; end
  class TooManyRequests < Forbidden; end
  class TooManyLoginAttempts < Forbidden; end
  class NotFound < ClientError; end
  class NotAcceptable < ClientError; end
  class Conflict < ClientError; end
  class UnsupportedMediaType < ClientError; end
  class UnprocessableEntity < ClientError; end
  class ServerError < Error; end
  class InternalServerError < ServerError; end
  class NotImplemented < ServerError; end
  class BadGateway < ServerError; end
  class ServiceUnavailable < ServerError; end
  class MissingContentType < ArgumentError; end
end
