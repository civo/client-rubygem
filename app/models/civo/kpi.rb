module Civo
  class Kpi < Base
    get :stats, "/v#{ENV["CIVO_API_VERSION"] || "2"}/kpi"
  end
end
