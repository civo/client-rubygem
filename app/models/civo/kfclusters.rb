module Civo
  class Kfclusters < Base
    get :all, "/v2/kfclusters", requires: [:region]
    get :find, "/v2/kfclusters/:id", requires: [:id, :region]
    post :create, "/v2/kfclusters", requires: [:name, :region]
    put :update, "/v2/kfclusters/:id", requires: [:id, :region]
    delete :remove, "/v2/kfclusters/:id", requires: [:id, :region]
    
    def to_partial_path
      "civo/kfclusters"
    end
  end
end
