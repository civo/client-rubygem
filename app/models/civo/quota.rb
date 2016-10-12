module Civo
  class Quota < Base
    get :current, "/v#{ENV["CIVO_API_VERSION"] || "1"}/quota"
    put :update, "/v#{ENV["CIVO_API_VERSION"] || "1"}/quota/:name", requires: [:name]

    def to_partial_path
      "civo/quota"
    end
  end
end
