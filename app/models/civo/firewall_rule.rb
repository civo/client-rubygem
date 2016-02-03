module Civo
  class FirewallRule < Base
    get :all, "/v1/firewalls/:name/rules", required: [:name]
    put :create, "/v1/firewalls/:name/rules", required: [:name, :protocol, :start_port,
      :cidr, :direction]
    delete :remove, "/v1/firewalls/:name/rules/:id", required: [:name, :id]
  end
end
