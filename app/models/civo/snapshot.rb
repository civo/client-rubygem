module Civo
  class Snapshot < Base
    get :all, "/v1/snapshots"
    get :find, "/v1/snapshots/:name", required: [:name]
    put :create, "/v1/snapshots/:name", required: [:name, :instance_id]
    delete :remove, "/v1/snapshots/:name", required: [:name]
  end
end
