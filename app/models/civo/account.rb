module Civo
  class Account < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/accounts"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/accounts/:id"
    get :stats, "/v#{ENV["CIVO_API_VERSION"] || "2"}/accounts/stats", requires: [:account_id]
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/accounts", requires: [:name]
    put :confirm, "/v#{ENV["CIVO_API_VERSION"] || "2"}/accounts/confirm/:token"
    put :reset, "/v#{ENV["CIVO_API_VERSION"] || "2"}/accounts/:id", requires: [:id]
    put :save, "/v#{ENV["CIVO_API_VERSION"] || "2"}/accounts/:id"
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/accounts/:id", requires: [:id]
    get :active_paid_services, "/v#{ENV["CIVO_API_VERSION"] || "2"}/accounts/:id/active_paid_services", requires: [:id]
    get :ids, "/v#{ENV["CIVO_API_VERSION"] || "2"}/accounts/ids"

    def to_partial_path
      "civo/account"
    end
  end
end
