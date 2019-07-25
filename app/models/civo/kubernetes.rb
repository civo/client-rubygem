module Civo
  class Kubernetes < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetesclusters"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetesclusters/:id", requires: [:id]
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetesclusters", requires: [:name]
    put :update, "/v2/kubernetesclusters/:id"
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kubernetesclusters/:id", requires: [:id], send_delete_body: true

    def to_partial_path
      "civo/kubernetes"
    end
  end
end
