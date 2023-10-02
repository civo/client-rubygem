module Civo
  class Database < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases", requires: [:region]
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases", requires: [:name, :size, :nodes, :region]
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id", requires: [:id, :region]
    patch :update, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id", requires: [:id, :region]
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id", requires: [:id, :region]
    get :list_backups, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id/backups", requires: [:id, :region]
    post :create_backup, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id/backups", requires: [:id, :region]
    put :update_backup, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id/backups", requires: [:id, :region]
    post :restore, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id/restore", requires: [:id, :region]
    get :versions, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/versions", requires: [:region]

    def to_partial_path
      "civo/database"
    end
  end
end
