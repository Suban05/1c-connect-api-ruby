# frozen_string_literal: true

module Connect
  module WebService
    module ConnectParameters
      module ParamsFactory
        def create_parameter(options)
          property = ConnectProperty.new(options[:name])
          value = ConnectValue.new(options[:type], options[:content])
          ConnectParameter.new(property, value)
        end

        def create_changed_from(options)
          create_date_time(
            name: 'ChangedFrom',
            content: options[:content]
          )
        end

        def create_date_time(options)
          content = nil
          if options[:content]
            content = options[:content].strftime('%Y-%m-%dT%H:%M:%S')
          end
          create_parameter(
            name: options[:name],
            type: 'xs:dateTime',
            content: content
          )
        end

        def create_string(options)
          create_parameter(
            name: options[:name],
            type: 'xs:string',
            content: options[:content]
          )
        end

        def create_date(options)
          create_parameter(
            name: options[:name],
            type: 'xs:date',
            content: options[:content]
          )
        end
      end
    end
  end
end
