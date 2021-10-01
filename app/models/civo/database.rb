module Civo
  class Database < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases", requires: [:name, :size, :region]
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id"
    put :update, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id"
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id", requires: [:id]
    put :upgrade, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id/resize", requires: [:size, :id]
    put :restore, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id/restore", requires: [:snapshot_id]
    get :snapshots, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id/snapshots"
    put :tags, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id/tags"

    def to_partial_path
      "civo/database"
    end
  end
end
