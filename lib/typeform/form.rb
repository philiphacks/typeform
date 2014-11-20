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

    def complete_entries(params = {})
      response = get(params.merge(completed: true))
      Hashie::Mash.new(response)
    end

    def incomplete_entries(params = {})
      response = get(params.merge(completed: false))
      Hashie::Mash.new(response)
    end

    private
      def get(params = nil)
        params ||= {}
        params[:key] = Typeform.api_key
        Typeform.get uri, :query => params
      end

      def uri
        "/form/#{form_id}"
      end
  end

end
