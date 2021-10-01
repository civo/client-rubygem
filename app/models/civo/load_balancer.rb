module Civo
  class LoadBalancer < Base
    get :all, "/v2/loadbalancers"
    get :find, "/v2/loadbalancers/:id"
    post :create, "/v2/loadbalancers", required: [:hostname]
    put :update, "/v2/loadbalancers/:id"
    delete :remove, "/v2/loadbalancers/:id", required: [:id]

    def to_partial_path
      "civo/loadbalancer"
    end
  end
end
