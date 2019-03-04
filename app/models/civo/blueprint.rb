module Civo
  class Blueprint < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/blueprints"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/blueprints", requires: [:name, :dsl_content, :template_id]
    put :update, "/v#{ENV["CIVO_API_VERSION"] || "1"}/blueprints/:id", requires: [:id]
    put :start, "/v#{ENV["CIVO_API_VERSION"] || "1"}/blueprints/:id/start", requires: [:id]
    put :stop, "/v#{ENV["CIVO_API_VERSION"] || "1"}/blueprints/:id/stop", requires: [:id]
    put :modify_template, "/v#{ENV["CIVO_API_VERSION"] || "1"}/blueprints/:id/template", requires: [:id, :checksum, :volume_id]
  end

  def to_partial_path
    "civo/blueprint"
  end
end
