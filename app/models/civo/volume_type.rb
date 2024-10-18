module Civo
  class VolumeType < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/volumetypes"
    
    def to_partial_path
      "civo/volumetype"
    end
  end
end
