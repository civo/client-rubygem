module Civo
  class Firewall < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/firewalls"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/firewalls", required: [:name]
    if ENV["CIVO_API_VERSION"] == "2"
      put :update, "/v2/firewalls/:id"
      delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/firewalls/:id", required: [:id]
    else
      delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/firewalls/:name", required: [:name]
    end

    def to_partial_path
      "civo/firewall"
    end
  end
end
