module Civo
  class FirewallRule < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/firewalls/:name/rules", required: [:name]
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/firewalls/:name/rules", required: [:name, :protocol, :start_port,
      :cidr, :direction]
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/firewalls/:name/rules/:id", required: [:name, :id]
  end
end
