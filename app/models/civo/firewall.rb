module Civo
  class Firewall < Base
    get :all, "/v1/firewalls"
    post :create, "/v1/firewalls", required: [:name]
    delete :remove, "/v1/firewalls/:name", required: [:name]
  end
end
