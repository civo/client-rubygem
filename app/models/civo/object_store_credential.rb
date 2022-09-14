module Civo
  class ObjectStoreCredential < Base
    get :all, "/v2/objectstore/credentials", requires: [:region]
    get :find, "/v2/objectstore/credentials/:id", requires: [:id, :region]
    post :create, "/v2/objectstore/credentials", requires: [:name, :region]
    put :update, "/v2/objectstore/credentials/:id", requires: [:id, :region]
    delete :remove, "/v2/objectstore/credentials/:id", requires: [:id, :region]

    def to_partial_path
      "civo/object_store_credentials"
    end
  end
end
