module Civo
  class Snapshot < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/snapshots"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/snapshots/:name", required: [:name]
    put :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/snapshots/:name", required: [:name, :instance_id]
    delete :remove_old, "/v#{ENV["CIVO_API_VERSION"] || "2"}/snapshots/:name", required: [:name]
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/snapshots/:id", required: [:id]

    def to_partial_path
      "civo/snapshot"
    end
  end
end
