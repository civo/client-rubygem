module Civo
  class KPI < Base
    get :stats, "/v#{ENV["CIVO_API_VERSION"] || "1"}/kpi"
  end
end
