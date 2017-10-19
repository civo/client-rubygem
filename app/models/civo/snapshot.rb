module Civo
  class Snapshot < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/snapshots"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "1"}/snapshots/:name", required: [:name]
    put :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/snapshots/:name", required: [:name, :instance_id]
    delete :remove_old, "/v#{ENV["CIVO_API_VERSION"] || "1"}/snapshots/:name", required: [:name], send_delete_body: true
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/snapshots/:id", required: [:id], send_delete_body: true

    def to_partial_path
      "civo/snapshot"
    end
  end
end
