module Civo
  class Region < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/regions"
  end
end
