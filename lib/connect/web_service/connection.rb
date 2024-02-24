# frozen_string_literal: true

module Connect
  module WebService
    module Connection
      def create_connection(client)
        auth_data = [client.login, client.password]
        Savon.client(
          wsdl: 'https://cus.1c-connect.com/cus/ws/PartnerWebAPI2?wsdl',
          basic_auth: auth_data
        )
      end
    end
  end
end
