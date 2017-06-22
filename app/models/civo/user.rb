module Civo
  class User < Base
    get :ping, "/v#{ENV["CIVO_API_VERSION"] || "1"}/ping"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users", required: %i{first_name last_name email_address}
    put :confirm, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users/confirm/:token"
    put :password, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users/password/:token"
    post :token, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users/token"
    post :login, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users/login"
    put :flags, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users/:id/flags"
    put :save, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users/:id"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users/:id"
    if ENV["CIVO_API_VERSION"] == "2"
      get :all, "/v2/users"
      get :find_by_token, "/v2/users/token/:token"
    end

    def to_partial_path
      "civo/user"
    end
  end
end
