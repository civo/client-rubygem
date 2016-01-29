module Civo
  class FirewallRule < Base
    get :all, "/v1/firewalls/:name/rules", required: [:name], fake: [{
      "id" => "12345678-9012-3456-7890-123456789012",
      "protocol" => "tcp",
      "start_port" => "0",
      "end_port" => "65535",
      "cidr" => "0.0.0.0/0",
      "direction" => "inbound",
      "restriction" => "allow"
    }]
    put :create, "/v1/firewalls/:name/rules", required: [:name, :protocol, :start_port, :end_port,
      :cidr, :direction, :restriction], fake: {
      "result" => "success"
    }
    delete :remove, "/v1/firewalls/:name/rules/:id", required: [:name, :id], fake: {
      "result" => "success"
    }
  end
end
