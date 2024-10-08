module Civo
  class Kubernetes < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters/:id", requires: [:id]
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters", requires: [:name], request_body_type: :json
    post :recycle, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters/:id/recycle", requires: [:id, :hostname]
    put :update, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters/:id", request_body_type: :json
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters/:id", requires: [:id]

    post :create_pool, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters/:cluster_id/pools", requires: [:cluster_id, :id], request_body_type: :json
    put :update_pool, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters/:cluster_id/pools/:id", requires: [:cluster_id, :id], request_body_type: :json
    delete :delete_pool, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters/:cluster_id/pools/:id", requires: [:cluster_id, :id], request_body_type: :json

    get :applications, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/applications"
    get :application, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/applications/:name", requires: [:name]

    get :versions, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/versions"

    def to_partial_path
      "civo/kubernetes"
    end
  end
end
