module Civo
  class LoadBalancer < Base
    get :all, "/v2/loadbalancers"
    get :find, "/v2/loadbalancers/:id", requires: [:id]
    post :create, "/v2/loadbalancers", required: [:name], request_body_type: :json
    put :update, "/v2/loadbalancers/:id", required: [:id, :name], request_body_type: :json
    delete :remove, "/v2/loadbalancers/:id", required: [:id]

    def to_partial_path
      "civo/loadbalancer"
    end
  end
end
