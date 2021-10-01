module Civo
  class Blueprint < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/blueprints"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/blueprints/:id", requires: [:id]
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/blueprints", requires: [:name, :dsl_content, :template_id]
    put :update, "/v#{ENV["CIVO_API_VERSION"] || "2"}/blueprints/:id", requires: [:id]
    put :stage, "/v#{ENV["CIVO_API_VERSION"] || "2"}/blueprints/:id/stage", requires: [:id]
    put :complete, "/v#{ENV["CIVO_API_VERSION"] || "2"}/blueprints/:id/complete", requires: [:id]
    put :fail, "/v#{ENV["CIVO_API_VERSION"] || "2"}/blueprints/:id/fail", requires: [:id]
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/blueprints/:id", requires: [:id]
    put :start, "/v#{ENV["CIVO_API_VERSION"] || "2"}/blueprints/:id/start", requires: [:id]
    put :stop, "/v#{ENV["CIVO_API_VERSION"] || "2"}/blueprints/:id/stop", requires: [:id]

    def to_partial_path
      "civo/blueprint"
    end
  end
end
