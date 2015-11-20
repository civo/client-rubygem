module Civo
  class Base < Flexirest::Base
    base_url Civo::Config.api_url

    before_request do |name, request|
      request.headers["Authorization"] = "bearer #{Civo::Token.default}"
    end
  end
end

Flexirest::Base.base_url = Civo::Config.api_url
Flexirest::Base.verbose!
Flexirest::Logger.logfile = "flexirest.log"
