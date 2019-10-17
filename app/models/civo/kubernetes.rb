module Civo
  class Kubernetes < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters/:id", requires: [:id]
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters", requires: [:name]
    post :recycle, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters/:id/recycle", requires: [:id, :hostname]
    put :update, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters/:id"
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/clusters/:id", requires: [:id], send_delete_body: true

    get :applications, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/applications"
    get :application, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/applications/:name", requires: [:name]

    get :versions, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetes/versions"

    def to_partial_path
      "civo/kubernetes"
    end
  end
end
