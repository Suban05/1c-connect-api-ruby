# frozen_string_literal: true

require 'json'

module Connect
  module HTTPService
    module Request
      include Connect::HTTPService::Connection

      def get(path, client, params = {})
        respond_with(connection(client).get(path, params))
      end

      def post(path, client, params = {}, files = {})
        respond_with(connection(client).post(path, JSON.dump(params)))
      end

      private

      def respond_with(response)
        begin
          JSON.parse(response.body)
        rescue
          {}
        end
      end
    end
  end
end
