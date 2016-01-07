module Civo
  class Ip < Base
    # get :for_instance, "/v1/instances/:id/ip", requires: [:id],
    #   fake: [ { "private_ip": "10.0.0.1" }, { "private_ip": "10.0.0.1", "public_ip": "31.28.96.101" }]
    # post :create, "/v1/instances/:id/ip", requires: [:id],
    #   fake: { "result": "ok" }
    # delete :remove, "/v1/instances/:id/ip/:ip_address", requires: [:id, :ip_address],
    #   fake: { "result": "ok" }
    # put :connect, "/v1/instances/:id/ip/:ip_address", requires: [:id, :ip_address],
    #   fake: { "result": "ok" }
  end
end
