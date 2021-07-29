module Civo
  class Firewall < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/firewalls"
    get :list_by_network, "/v#{ENV["CIVO_API_VERSION"] || "2"}/firewalls/list_by_network"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/firewalls", required: [:name]
    if ENV["CIVO_API_VERSION"] == "2"
      put :update, "/v2/firewalls/:id"
      delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/firewalls/:id", required: [:id], send_delete_body: true
    else
      delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/firewalls/:name", required: [:name], send_delete_body: true
    end

    def to_partial_path
      "civo/firewall"
    end
  end
end
