module Civo
  class Ip < Base
    post :create, "/v1/instances/:id/ip", requires: [:id], defaults: {public: true}
    delete :remove, "/v1/instances/:id/ip/:ip_address", requires: [:id, :ip_address]
    put :connect, "/v1/instances/:id/ip/:ip_address", requires: [:id, :ip_address, :private_ip]
  end
end
