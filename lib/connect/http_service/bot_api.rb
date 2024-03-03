module Connect
  module HTTPService
    module BotApi
      include Connect::HTTPService::Request

      def appoint_start(options)
        post(
          'v1/line/appoint/start',
          self,
          options
        )
      end

      def appoint_spec(options)
        post(
          'v1/line/appoint/spec',
          self,
          options
        )
      end

      def drop_treatment(options)
        post(
          'v1/line/drop/treatment',
          self,
          options
        )
      end

      def send_message_line(options)
        post(
          'v1/line/send/message',
          self,
          options
        )
      end

      def drop_keyboard(options)
        post(
          'v1/line/drop/keyboard',
          self,
          options
        )
      end

      def send_message_colleague(options)
        post(
          'v1/colleague/send/message',
          self,
          options
        )
      end

      def send_message_conference(options)
        post(
          'v1/conference/send/message',
          self,
          options
        )
      end
    end
  end
end
