module Civo
  class Team < Base
    get :all, "/v1/teams"
    post :create, "/v1/teams"
    put :update, "/v1/teams/:id", requires: %i{id}
    delete :remove, "/v1/teams/:id", requires: %i{id}

    get :my_memberships, "/v1/team_memberships"
    post :member_invite, "/v1/teams/:id/memberships/:user_id", requires: %i{id user_id email_address}
    put :member_status, "/v1/teams/:id/memberships/:user_id", requires: %i{id user_id status}
    get :members, "/v1/teams/:id/memberships", requires: %i{id}
    delete :member_remove, "/v1/teams/:id/memberships/:user_id", requires: %i{id user_id}
  end
end
