# WARNING!
# This module is for an in-development feature of Civo and isn't intended to
# be used by the general public yet. Public accounts won't even have the
# feature flag enabled. Do not bother trying to use this class.
module Civo
  class Team < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/teams"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/teams"
    put :update, "/v#{ENV["CIVO_API_VERSION"] || "2"}/teams/:id", requires: %i{id}
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/teams/:id", requires: %i{id}, send_delete_body: true

    get :members, "/v#{ENV["CIVO_API_VERSION"] || "2"}/teams/:id/members"
    post :add_member, "/v#{ENV["CIVO_API_VERSION"] || "2"}/teams/:id/members", requires: [:user_id]
    post :update_member, "/v#{ENV["CIVO_API_VERSION"] || "2"}/teams/:id/members/:member_id"
    delete :remove_member, "/v#{ENV["CIVO_API_VERSION"] || "2"}/teams/:id/members/:member_id"
  end
end
