module Civo
  class ObjectStore < Base
    get :all, "/v2/objectstores", requires: [:region]
    get :find, "/v2/objectstores/:id", requires: [:id]
    post :create, "/v2/objectstores", requires: [:name, :max_size_gb, :max_objects]
    put :update, "/v2/objectstores/:id", requires: [:id]
    delete :remove, "/v2/objectstores/:id", requires: [:id]

    def to_partial_path
      "civo/object_store"
    end
  end
end
