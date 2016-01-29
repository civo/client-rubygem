module Civo
  class Snapshot < Base
    get :all, "/v1/snapshots", fake: [{
      "name": "my-instance-snapshot",
      "instance_id": "44aab548-61ca-11e5-860e-5cf9389be614",
      "safe": true,
      "requested_at": "2015-09-20T19:31:36+00:00",
      "completed_at": nil,
      "status": "new"
    }]
    get :find, "/v1/snapshots/:name", fake: {
      "name": "my-instance-snapshot",
      "instance_id": "44aab548-61ca-11e5-860e-5cf9389be614",
      "safe": true,
      "requested_at": "2015-09-20T19:31:36+00:00",
      "completed_at": nil,
      "status": "new"
    }
    put :create, "/v1/snapshots/:name", required: [:instance_id], fake: {
      "name": "my-instance-snapshot",
      "instance_id": "44aab548-61ca-11e5-860e-5cf9389be614",
      "safe": true,
      "requested_at": "2015-09-20T19:31:36+00:00",
      "completed_at": nil,
      "status": "new"
    }
    delete :remove, "/v1/templates/:name", fake: {
      "name": "my-instance-snapshot",
      "result": "ok"
    }
  end
end
