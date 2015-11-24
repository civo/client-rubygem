module Civo
  class Base < ::Flexirest::Base
    before_request do |name, request|
      request.headers["Authorization"] = "bearer #{ENV["CIVO_TOKEN"] || Civo::Token.default}"
    end
  end
end

Flexirest::Base.base_url = ENV["CIVO_URL"] || Civo::Config.api_url
