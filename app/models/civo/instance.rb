module Civo
  class Instance < Base
    get :all, "/v1/instances"
    post :create, "/v1/instances", requires: [:hostname, :size, :region, :ssh_key],
      defaults: {public_ip: true, template: "ubuntu-14.04", initial_user: "civo"}
    delete :remove, "/v1/instances/:id", requires: [:id]
    post :reboot, "/v1/instances/:id/reboots", requires: [:id]
    put :stop, "/v1/instances/:id/stop", requires: [:id]
    put :start, "/v1/instances/:id/start", requires: [:id]
    post :reboot, "/v1/instances/:id/reboots", requires: [:id]
    put :upgrade, "/v1/instances/:id", requires: [:size, :id]

    def ip_addresses
      @ip_addresses ||= (self._attributes[:ip_addresses].items rescue []).map do |ip|
        if ip.public_ip
          "#{ip.private_ip}=>#{ip.public_ip}"
        else
          "#{ip.private_ip}"
        end
      end.join(", ")
    end
  end
end
