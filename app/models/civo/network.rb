module Civo
  class Network < Base
    if ENV["CIVO_API_VERSION"] == "2"
      get :all, "/v2/networks"
      post :create, "/v2/networks", required: [:label]
      put :update, "/v2/networks/:id"
      delete :remove, "/v2/networks/:id", required: [:id]
      put :pseudo_migrate, "/v2/network-pseudo-migrate"
    else
      get :all, "/v1/networks"
      post :create, "/v1/networks", required: [:name]
      put :update, "/v1/networks/:name", required: [:name]
      delete :remove, "/v1/networks/:name", required: [:name]
    end

    def to_partial_path
      "civo/network"
    end
  end
end
