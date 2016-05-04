module Civo
  class Action < Base
    get :all, "/v1/actions"
    post :create, "/v1/actions"
  end
end
