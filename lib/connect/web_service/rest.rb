# frozen_string_literal: true

module Connect
  module WebService
    module Rest
      include Connect::WebService::Request
      include Connect::WebService::ConnectParameters::ParamsFactory

      def region_read
        call(self, method: :region_read)
      end

      def department_read(options = {})
        params = []
        add_param(params, create_changed_from(options))
        call(self, method: :department_read, params: params)
      end

      def department_add(options)
        params = []
        add_param(params, create_string(name: 'Name', content: options[:name], required: true))
        call(self, method: :department_add, params: params)
      end

      def department_edit(options)
        params = []
        add_param(params, create_string(name: 'DepartmentID', content: options[:department_id], required: true))
        add_param(params, create_string(name: 'Name', content: options[:name]))
        call(self, method: :department_edit, params: params)
      end

      def department_delete(options)
        params = []
        add_param(params, create_string(name: 'DepartmentID', content: options[:department_id], required: true))
        call(self, method: :department_delete, params: params)
      end

      def specialist_read(options = {})
        params = []
        add_param(params, create_changed_from(options))
        call(self, method: :specialist_read, params: params)
      end

      def specialist_add(options)
        params = []
        add_param(params, create_string(name: 'Name', content: options[:name], required: true))
        add_param(params, create_string(name: 'email', content: options[:email], required: true))
        add_param(params, create_string(name: 'Surname', content: options[:surname]))
        add_param(params, create_string(name: 'SecondaryName', content: options[:secondary_name]))
        add_param(params, create_string(name: 'Password', content: options[:password]))
        add_param(params, create_date(name: 'Birthday', content: options[:birthday]))
        add_param(params, create_string(name: 'Post', content: options[:post]))
        add_param(params, create_string(name: 'DepartmentID', content: options[:department_id]))
        add_param(params, create_string(name: 'Phone', content: options[:phone]))

        call(self, method: :specialist_add, params: params)
      end

      def specialist_edit(options)
        params = []
        add_param(params, create_string(name: 'SpecialistID', content: options[:specialist_id], required: true))
        add_param(params, create_string(name: 'Name', content: options[:name]))
        add_param(params, create_string(name: 'Surname', content: options[:surname]))
        add_param(params, create_string(name: 'Email', content: options[:email]))
        add_param(params, create_string(name: 'SecondaryName', content: options[:secondary_name]))
        add_param(params, create_string(name: 'Password', content: options[:password]))
        add_param(params, create_date(name: 'Birthday', content: options[:birthday]))
        add_param(params, create_string(name: 'Post', content: options[:post]))
        add_param(params, create_string(name: 'DepartmentID', content: options[:department_id]))
        add_param(params, create_string(name: 'Phone', content: options[:phone]))

        call(self, method: :specialist_edit, params: params)
      end

      def client_user_read(options = {})
        params = []
        add_param(params, create_changed_from(options))
        add_param(params, create_string(name: 'ClientID', content: options[:client_id]))
        call(self, method: :client_user_read, params: params)
      end

      def get_opened_service_treatments(options = {})
        params = []
        add_param(params, create_date(name: 'OpenedFrom', content: options[:opened_from], required: true))
        add_param(params, create_date_time(name: 'OpenedTo', content: options[:opened_to]))
        add_param(params, create_string(name: 'ClientID', content: options[:client_id]))
        add_param(params, create_string(name: 'ServiceUserID', content: options[:service_user_id]))
        add_param(params, create_string(name: 'ServiceID', content: options[:service_id]))
        add_param(params, create_string(name: 'SpecialistID', content: options[:specialist_id]))
        call(self, method: :get_opened_service_treatments, params: params)
      end

      def add_param(params, param)
        params << param if param.required || param.value.content
      end
    end
  end
end
