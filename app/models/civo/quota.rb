module Civo
  class Quota < Base
    get :current, "/v#{ENV["CIVO_API_VERSION"] || "1"}/quota"
    put :update, "/v#{ENV["CIVO_API_VERSION"] || "1"}/quota/:name", requires: [:name]
    if ENV["CIVO_API_VERSION"] == "2"
      get :all, "/v2/quotas"
      get :find, "/v#{ENV["CIVO_API_VERSION"] || "1"}/quota/:id", requires: [:id]
      put :save, "/v#{ENV["CIVO_API_VERSION"] || "1"}/quota/:id", requires: [:id]
    end

    def to_partial_path
      "civo/quota"
    end
  end
end
