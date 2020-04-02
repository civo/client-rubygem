module Civo
  class Ip < Base
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/instances/:id/ip", requires: [:id], defaults: {public: true}
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/instances/:id/ip/:ip_address", requires: [:id, :ip_address], send_delete_body: true
    put :connect, "/v#{ENV["CIVO_API_VERSION"] || "2"}/instances/:id/ip/:ip_address", requires: [:id, :ip_address, :private_ip]

    def to_partial_path
      "civo/ip"
    end
  end

  class IP < Ip ; end
end
