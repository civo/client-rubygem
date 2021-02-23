module Civo
  class DiskImage < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/disk_images"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/disk_images/:id"
    
    def to_partial_path
      "civo/disk_image"
    end
  end
end
