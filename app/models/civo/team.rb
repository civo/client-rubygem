module Civo
  class Team < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/teams"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/teams"
    put :update, "/v#{ENV["CIVO_API_VERSION"] || "1"}/teams/:id", requires: %i{id}
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/teams/:id", requires: %i{id}, send_delete_body: true

    get :my_memberships, "/v#{ENV["CIVO_API_VERSION"] || "1"}/team_memberships"
    post :member_invite, "/v#{ENV["CIVO_API_VERSION"] || "1"}/teams/:id/memberships/:user_id", requires: %i{id user_id email_address}
    put :member_status, "/v#{ENV["CIVO_API_VERSION"] || "1"}/teams/:id/memberships/:user_id", requires: %i{id user_id status}
    get :members, "/v#{ENV["CIVO_API_VERSION"] || "1"}/teams/:id/memberships", requires: %i{id}
    post :permissions, "/v#{ENV["CIVO_API_VERSION"] || "1"}/teams/:id/memberships", requires: %i{email_address permissions}
    delete :member_remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/teams/:id/memberships/:user_id", requires: %i{id user_id}, send_delete_body: true

    def to_partial_path
      "civo/team"
    end
  end
end
