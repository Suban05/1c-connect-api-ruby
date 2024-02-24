# frozen_string_literal: true

module Connect
  module HTTPService
    module Rest
      include Connect::HTTPService::InformationApi
      include Connect::HTTPService::BotApi
    end
  end
end
