# frozen_string_literal: true

module Connect
  module WebService
    module ConnectParameters
      class ParamsSerializer
        def initialize(params)
          @params = params
          @xml = Builder::XmlMarkup.new
        end

        def serialize
          @xml.par(:Params) do
            @params.each do |param|
              property = param.property
              value = param.value
              @xml.Property('xmlns' => property.xmlns, 'name' => property.name) do
                @xml.Value(value.content, 'xsi:type' => value.type)
              end
            end
          end
          @xml.target!
        end
      end
    end
  end
end
