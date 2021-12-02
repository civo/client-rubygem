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
      [
        {
          id: 23,
          name: "Johnny",
          algorithm: "round_robin",
          state: "available",
          public_ipv4: "192.168.1.10",
          private_ipv4: "10.10.10.10",
          firewall_id: "86E2749F-8FA1-4D49-8833-299D02E585B8",
          cluster_id: "96E2749F-8FA1-4D49-8833-299D02E585B8"
        },
        {
          id: 223,
          name: "Dep",
          algorithm: "weighted_fixed",
          state: "available",
          public_ipv4: "192.168.1.30",
          private_ipv4: "10.10.10.12",
          firewall_id: "36E2749F-8FA1-4D49-8833-299D02E585B8",
          cluster_id: "46E2749F-8FA1-4D49-8833-299D02E585B8"
        }
      ].to_json
    end

    def get_loadbalancer
      {
        id: 23,
        name: "Johnny",
        algorithm: "round_robin",
        state: "available",
        public_ipv4: "192.168.1.10",
        private_ipv4: "10.10.10.10",
        firewall_id: "86E2749F-8FA1-4D49-8833-299D02E585B8",
        cluster_id: "96E2749F-8FA1-4D49-8833-299D02E585B8",
        endpoints: [
          {
            ip: "192.168.1.4",
            protocol: "TCP",
            source_port: 80,
            target_port: 31579
          },
          {
            ip: "192.168.1.5",
            protocol: "TCP",
            source_port: 80,
            target_port: 31579
          }
        ]
      }.to_json
    end

    def delete_loadbalancer
      { result: "Success" }.to_json
    end
  end
end
