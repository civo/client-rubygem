module Civo
  class DnsDomain < Base
    get :all, "/v2/loadbalancers"
    get :find, "/v2/loadbalancers/:id"
    post :create, "/v2/loadbalancers", required: [:hostname]
    put :update, "/v2/loadbalancers/:id"
    delete :remove, "/v2/loadbalancers/:id", required: [:id], send_delete_body: true

    def to_partial_path
      "civo/loadbalancer"
    end
  end
end
