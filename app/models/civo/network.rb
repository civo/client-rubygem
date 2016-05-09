module Civo
  class Network < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/networks"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/networks", required: [:name]
    put :update, "/v#{ENV["CIVO_API_VERSION"] || "1"}/networks/:name", required: [:name]
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/networks/:name", required: [:name]
  end
end
