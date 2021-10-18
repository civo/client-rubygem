module Civo
  class User < Base
    get :ping, "/v#{ENV["CIVO_API_VERSION"] || "2"}/ping"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/users", required: %i{first_name last_name email_address}
    put :confirm, "/v#{ENV["CIVO_API_VERSION"] || "2"}/users/confirm/:token"
    put :password, "/v#{ENV["CIVO_API_VERSION"] || "2"}/users/password/:token"
    post :token, "/v#{ENV["CIVO_API_VERSION"] || "2"}/users/token"
    post :login, "/v#{ENV["CIVO_API_VERSION"] || "2"}/users/login"
    put :flags, "/v#{ENV["CIVO_API_VERSION"] || "2"}/users/:id/flags"
    put :save, "/v#{ENV["CIVO_API_VERSION"] || "2"}/users/:id"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/users/:id"
    get :everything, "/v#{ENV["CIVO_API_VERSION"] || "2"}/users/:id/everything", has_many: {accounts: Civo::Account, teams: Civo::Team, organisations: Civo::Organisation, roles: Civo::Role}
    if ENV["CIVO_API_VERSION"] == "2"
      get :all, "/v2/users"
      get :find_by_token, "/v2/users/token/:token"
    end

    def to_partial_path
      "civo/user"
    end
  end
end
