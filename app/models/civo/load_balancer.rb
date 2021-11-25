module Civo
  class LoadBalancer < Base
    get :all, "/v2/loadbalancers", fake: :loadbalancers
    get :find, "/v2/loadbalancers/:id", fake: :get_loadbalancer
    post :create, "/v2/loadbalancers", required: [:hostname], fake: :get_loadbalancer
    put :update, "/v2/loadbalancers/:id", fake: :get_loadbalancer
    delete :remove, "/v2/loadbalancers/:id", required: [:id], fake: :delete_loadbalancer

    def to_partial_path
      "civo/loadbalancer"
    end

    def loadbalancers
      [{ id: 23, name: "Johnny", algorithm: "round_robin" }, { id: 223, name: "Dep", algorithm: "weighted_fixed" }].to_json
    end

    def get_loadbalancer
      { id: 23, name: "Johnny", algorithm: "round_robin" }.to_json
    end

    def delete_loadbalancer
      { result: "Ok" }.to_json
    end
  end
end
