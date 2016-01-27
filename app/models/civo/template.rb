module Civo
  class Template < Base
    get :all, "/v1/templates"
    put :save, "/v1/templates/:id"
    post :create, "/v1/templates"
    delete :remove, "/v1/templates/:id"
  end
end
