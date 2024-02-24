# frozen_string_literal: true

module Connect
  module WebService
    class Client
      include Connect::WebService::Connection
      include Connect::WebService::Rest

      attr_reader :login, :password, :connection

      def initialize(options)
        @login = options[:login]
        @password = options[:password]
        @connection = create_connection(self)
      end
    end
  end
end
