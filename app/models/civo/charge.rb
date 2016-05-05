module Civo
  class Charge < Base
    get :for, "/v#{ENV["CIVO_API_VERSION"] || "1"}/charges"
  end
end
