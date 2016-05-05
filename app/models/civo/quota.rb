module Civo
  class Quota < Base
    get :current, "/v#{ENV["CIVO_API_VERSION"] || "1"}/quota"
    put :update, "/v#{ENV["CIVO_API_VERSION"] || "1"}/quota/:name", requires: [:name]
  end
end
