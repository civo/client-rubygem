module Civo
  class Template < Base
    get :all, "/v1/templates"
    get :details, "/v1/templates/:id"
    put :save, "/v1/templates/:id"
    post :create, "/v1/templates", required: [:name, :image_id]
    delete :remove, "/v1/templates/:id"
  end
end
