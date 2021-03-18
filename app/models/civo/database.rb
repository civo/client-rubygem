module Civo
  class Database < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id"
    
    def to_partial_path
      "civo/database"
    end
  end
end
