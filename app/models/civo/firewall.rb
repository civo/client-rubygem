module Civo
  class Firewall < Base
    get :all, "/v1/firewalls", fake: [{
      "name" => "instance-12345",
      "instance_count" => 10,
      "rules_count" => 3
    }]
    put :create, "/v1/firewalls/:name", required: [:name], fake: {
      "result" => "success"
    }
    delete :remove, "/v1/firewalls/:name", required: [:name], fake: {
      "result" => "success"
    }
  end
end
