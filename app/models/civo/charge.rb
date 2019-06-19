module Civo
  class Charge < Base
    get :for, "/v#{ENV["CIVO_API_VERSION"] || "2"}/charges"

    def to_partial_path
      "civo/charge"
    end
  end
end
