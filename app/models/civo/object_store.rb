module Civo
  class ObjectStore < Base
    get :all, "/v2/objectstores", requires: [:region]
    get :find, "/v2/objectstores/:id", requires: [:id, :region]
    post :create, "/v2/objectstores", requires: [:name, :max_size_gb, :region], defaults: {max_size_gb: 500}
    put :update, "/v2/objectstores/:id", requires: [:id, :region]
    delete :remove, "/v2/objectstores/:id", requires: [:id, :region]

    def to_partial_path
      "civo/object_store"
    end
  end
end
