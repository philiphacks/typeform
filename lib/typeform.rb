require "httparty"
require "hashie"
Hash.send :include, Hashie::Extensions

require "typeform/version"
require "typeform/form"

module Typeform
  class << self
    # Allow Typeform.api_key = "..."
    def api_key=(api_key)
      Typeform.api_key = api_key
    end

    # Allow Typeform.base_uri = "..."
    def base_uri=(uri)
      Typeform.base_uri = uri
    end
  end

  # Represents a Typeform API error and contains specific data about the error.
  class TypeformError < StandardError
    attr_reader :data
    def initialize(data)
      @data = Hashie::Mash.new(data)
      super "The Typeform API responded with the following error - #{data}"
    end
  end

  class ClientError < StandardError; end
  class ServerError < StandardError; end
  class BadRequest < TypeformError; end
  class Unauthorized < StandardError; end
  class NotFound < ClientError; end
  class Unavailable < StandardError; end

  class Typeform
    include HTTParty

    @@base_uri = "https://api.typeform.com/v0/"
    @@api_key = ""
    headers({ 
      'User-Agent' => "typeform-rest-#{VERSION}",
      'Content-Type' => 'application/json; charset=utf-8',
      'Accept-Encoding' => 'gzip, deflate'
    })
    self.base_uri @@base_uri

    class << self
      # Get the API key (Typeform::Typeform.api_key)
      def api_key; @@api_key end

      # Set the API key
      def api_key=(api_key)
        return @@api_key unless api_key
        @@api_key = api_key
      end

      def get(*args); handle_response super end
      # No POST, PUT or DELETE for now - Read only Typeform API
      # def post(*args); handle_response super end
      # def put(*args); handle_response super end
      # def delete(*args); handle_response super end

      def handle_response(response) # :nodoc:
        case response.code
        when 400
          raise BadRequest.new response.parsed_response
        when 401
          raise Unauthorized.new
        when 404
          raise NotFound.new
        when 400...500
          raise ClientError.new response.parsed_response
        when 500...600
          raise ServerError.new
        else
          response
        end
      end
    end
  end
end
