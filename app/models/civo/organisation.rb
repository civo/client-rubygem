# WARNING!
# This module is for an in-development feature of Civo and isn't intended to
# be used by the general public yet. Public accounts won't even have the
# feature flag enabled. Do not bother trying to use this class.
module Civo
  class Organisation < Base
    get :current, "/v#{ENV["CIVO_API_VERSION"] || "2"}/organisation"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/organisation", requires: [:name]
    get :accounts, "/v#{ENV["CIVO_API_VERSION"] || "2"}/organisation/accounts"
    post :add_account, "/v#{ENV["CIVO_API_VERSION"] || "2"}/organisation/accounts", requires: [:account_id]
  end
end
