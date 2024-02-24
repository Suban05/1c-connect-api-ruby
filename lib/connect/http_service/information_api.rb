module Connect
  module HTTPService
    module InformationApi
      include Connect::HTTPService::Request
      
      def get_treatments(options = {})
        get(
          'v1/line/treatment/',
          self,
          options
        )
      end

      def get_subscriber(options)
        get(
          "v1/line/subscriber/#{options[:user_id]}",
          self
        )
      end

      def get_subscribers
        get(
          'v1/line/subscribers',
          self
        )
      end

      def get_subscriptions(options)
        get(
          'v1/line/subscriptions',
          self,
          options
        )
      end

      def get_lines
        get(
          'v1/line',
          self
        )
      end

      def get_specialist(options)
        get(
          "v1/line/specialist/#{options[:user_id]}",
          self
        )
      end

      def get_specialists
        get(
          'v1/line/specialists',
          self
        )
      end

      def get_specialists_available(options)
        get(
          "v1/line/specialists/#{options[:line_id]}/available",
          self,
          options
        )
      end

      def get_competences(options = {})
        get(
          "v1/line/competences",
          self,
          options
        )
      end

      def get_ticket(options)
        get(
          "v1/ticket/#{options[:id]}",
          self
        )
      end

      def get_ticket_by_number(options)
        get(
          "v1/ticket/number/#{options[:number]}",
          self
        )
      end
    end
  end
end
