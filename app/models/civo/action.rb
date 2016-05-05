module Civo
  class Action < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/actions"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/actions"
  end
end
