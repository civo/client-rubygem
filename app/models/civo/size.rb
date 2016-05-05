module Civo
  class Size < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/sizes"
    put :reset, "/v#{ENV["CIVO_API_VERSION"] || "1"}/sizes"
  end
end
