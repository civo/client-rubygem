module Civo
  class Region < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/regions"

    def to_partial_path
      "civo/region"
    end
  end
end
