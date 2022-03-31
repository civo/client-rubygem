module Civo
  class Account < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications",
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications/:id", requires: [:id, :region]
    post :create "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications", requires: [:name, :region, :network_id, :size, :sshkey_ids],
    put :update, "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications/:id", requires: [:id, :region]
    delete :remove "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications/:id", requires: [:id, :region]
  end
end