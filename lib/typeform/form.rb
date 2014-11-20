require 'typeform'
require 'json'

module Typeform

  class Form
    attr_reader :form_id

    def initialize(form_id)
      @form_id = form_id
    end

    def all_entries
      response = get
      Hashie::Mash.new(response)
    end

    def complete_entries
    end

    def incomplete_entries
    end

    private
      def get(params = nil)
        Typeform.get uri_for(params), :query => { key: Typeform.api_key }
      end

      def uri_for(params = nil)
        params = "?#{params}" if params
        "/form/#{form_id}#{params}"
      end
  end

end
