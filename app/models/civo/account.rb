module Civo
  class Account < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts/:id", requires: [:id]
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts", requires: [:name]
    put :reset, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts/:name", requires: [:name]
    put :save, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts"
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts/:name", requires: [:name]
  end
end
