module Civo
  class Snapshot < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/snapshots"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "1"}/snapshots/:name", required: [:name]
    put :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/snapshots/:name", required: [:name, :instance_id]
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/snapshots/:name", required: [:name]
  end
end
