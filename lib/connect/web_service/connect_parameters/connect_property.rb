# frozen_string_literal: true

module Connect
  module WebService
    module ConnectParameters
      class ConnectProperty
        attr_accessor :xmlns, :name

        def initialize(name)
          @xmlns = 'http://v8.1c.ru/8.1/data/core'
          @name = name
        end
      end
    end
  end
end
