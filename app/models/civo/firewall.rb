module Civo
  class Firewall < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/firewalls"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/firewalls", required: [:name]
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/firewalls/:name", required: [:name]
    if ENV["CIVO_API_VERSION"] == "2"
      put :update, "/v2/firewalls/:id"
    end

    def to_partial_path
      "civo/firewall"
    end
  end
end
