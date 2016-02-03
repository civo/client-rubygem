module Civo
  class Firewall < Base
    get :all, "/v1/firewalls"
    put :create, "/v1/firewalls/:name", required: [:name]
    delete :remove, "/v1/firewalls/:name", required: [:name]
  end
end
