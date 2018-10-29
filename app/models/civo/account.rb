module Civo
  class Account < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts/:id"
    get :stats, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts/stats", requires: [:account_id]
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts", requires: [:name]
    put :confirm, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts/confirm/:token"
    put :fraud_complete, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts/fraud/:id", requires: [:id, :stage, :result]
    put :reset, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts/:id", requires: [:id]
    put :save, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts/:id"
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/accounts/:id", requires: [:id], send_delete_body: true

    def to_partial_path
      "civo/account"
    end
  end
end
