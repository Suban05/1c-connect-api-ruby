# frozen_string_literal: true

module Connect
  module WebService
    module ConnectParameters
      class ConnectParameter
        attr_accessor :property, :value, :required

        def initialize(property, value, required = false)
          @property = property
          @value = value
          @required = required
        end
      end
    end
  end
end
