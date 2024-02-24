# frozen_string_literal: true

module Connect
  module WebService
    module Request
      def call(client, options)
        params = []
        params = options[:params] if options[:params]
        method = options[:method]
        method_as_s = method.to_s
        camel_case_method_name = method_as_s.to_s.gsub(/(?:_|\b)([a-z])/) { $1.upcase }
        xml_body = build_params(camel_case_method_name, params)
        xml = xml_template(xml_body)
        response = client.connection.call(method, xml: xml)
        body = response.body
        body_key = "#{method_as_s}_response".to_sym
        result = []
        if (property = body.dig(body_key, :return, :property)) && property.size > 1 && property[1][:value][:row]
          result = property[1][:value][:row]
        end
        result
      end

      private

      def build_params(name, params = [])
        serializer = Connect::WebService::ConnectParameters::ParamsSerializer.new(params)
        params = serializer.serialize
        "<par:#{name}>#{params}</par:#{name}>"
      end

      def xml_template(body)
        <<-XML
          <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:par="http://buhphone.com/PartnerWebAPI2" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:core="http://v8.1c.ru/8.1/data/core" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <soap:Header/>
            <soap:Body>
              #{body}
            </soap:Body>
          </soap:Envelope>
        XML
      end
    end
  end
end
