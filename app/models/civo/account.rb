module Civo
  class Account < Base
    get :all, "/v1/accounts"
    post :create, "/v1/accounts"
    put :reset, "/v1/accounts/:name"
    delete :remove, "/v1/accounts/:name"
  end
end
