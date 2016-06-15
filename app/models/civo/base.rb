module Civo
  class Base < ::Flexirest::Base
    before_request do |name, request|
      request.headers["Authorization"] = "bearer #{ENV["CIVO_TOKEN"]}"
    end
  end
end

Flexirest::Base.base_url = ENV["CIVO_URL"]
Flexirest::Base.verbose! if ENV["CIVO_VERBOSE"]
