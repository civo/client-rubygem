module Civo
  class Application < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications/:id", requires: [:id]
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications", requires: [:name, :region, :network_id, :size], request_body_type: :json
    patch :update, "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications/:id", request_body_type: :json
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications/:id", requires: [:id]

    def to_partial_path
      "civo/application"
    end
  end
end