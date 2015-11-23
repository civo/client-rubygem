module Civo
  class Account < Base
    get :all, "/v1/accounts"
    post :create, "/v1/accounts", requires: [:name]
    put :reset, "/v1/accounts/:name", requires: [:name]
    delete :remove, "/v1/accounts/:name", requires: [:name]
  end
end
