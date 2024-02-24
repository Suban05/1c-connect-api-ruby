module Connect
  module HTTPService
    class Client
      include Connect::HTTPService::Rest

      attr_reader :login, :password

      def initialize(options)
        @login = options[:login]
        @password = options[:password]
      end
    end
  end
end
