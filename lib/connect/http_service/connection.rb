# frozen_string_literal: true

module Connect
  module HTTPService
    module Connection
      BASE_URL = 'https://push.1c-connect.com/'

      def connection(client)
        Faraday.new(options) do |faraday|
          faraday.request :authorization, :basic, client.login, client.password
          faraday.adapter Faraday.default_adapter
        end
      end

      private

      def options
        {
          headers: {
            'content-type': 'application/json'
          },
          url: BASE_URL
        }
      end
    end
  end
end
