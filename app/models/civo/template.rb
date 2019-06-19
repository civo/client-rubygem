module Civo
  class Template < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/templates"
    get :details, "/v#{ENV["CIVO_API_VERSION"] || "2"}/templates/:id"
    put :save, "/v#{ENV["CIVO_API_VERSION"] || "2"}/templates/:id"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/templates", required: [:name, :image_id]
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/templates/:id", send_delete_body: true
  end

  def to_partial_path
    "civo/template"
  end
end
