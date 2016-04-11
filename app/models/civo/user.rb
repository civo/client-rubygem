module Civo
  class User < Base
    get :ping, "/v1/ping"
    post :create, "/v1/users", required: %i{first_name last_name email_address}
    put :confirm, "/v1/users/confirm/:token"
    put :password, "/v1/users/password/:token"
    get :token, "/v1/users/token"
    post :login, "/v1/users/login"
    put :flags, "/v1/users/:id/flags"
    put :update, "/v1/users/:id"
    get :find, "/v1/users/:id"
  end
end
