module Civo
  class ReservedIp < Base
    get :all, "/v2/ips", requires: [:region]
    get :find, "/v2/ips/:id", requires: [:id, :region]
    post :create, "/v2/ips", requires: [:region]
    put :update, "/v2/ips/:id", requires: [:id, :region]
    delete :remove, "/v2/ips/:id", requires: [:id, :region]
    post :actions, "/v2/ips/:id/actions", requires: [:id, :region, :action]

    def to_partial_path
      "civo/ips"
    end
  end
end