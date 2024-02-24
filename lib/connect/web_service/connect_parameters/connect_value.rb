# frozen_string_literal: true

module Connect
  module WebService
    module ConnectParameters
      class ConnectValue
        attr_accessor :type, :content

        def initialize(type, content)
          @type = type
          @content = content
        end
      end
    end
  end
end
