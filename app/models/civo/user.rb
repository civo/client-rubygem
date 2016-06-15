module Civo
  class User < Base
    get :ping, "/v#{ENV["CIVO_API_VERSION"] || "1"}/ping"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users", required: %i{first_name last_name email_address}
    put :confirm, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users/confirm/:token"
    put :password, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users/password/:token"
    post :token, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users/token"
    post :login, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users/login"
    put :flags, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users/:id/flags"
    put :save, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "1"}/users/:id"
  end
end
