module Civo
  class Volume < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/volumes"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/volumes/:id", requires: [:id]
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/volumes", requires: [:name, :size_gb]
    put :update, "/v2/volumes/:id", requires: [:id, :name]
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/volumes/:id", requires: [:id], send_delete_body: true
    put :attach, "/v2/volumes/:id/attach", requires: [:id, :instance_id]
    put :detach, "/v2/volumes/:id/detach", requires: [:id]
    put :resize, "/v2/volumes/:id/resize", requires: [:id, :size_gb]
  end
end
