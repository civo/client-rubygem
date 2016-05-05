module Civo
  class Account < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts", requires: [:name]
    put :reset, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts/:name", requires: [:name]
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts/:name", requires: [:name]
  end
end
