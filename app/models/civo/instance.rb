module Civo
  class Instance < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances"
    get :high_cpu, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/high_cpu"
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/:id", requires: [:id]
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances", requires: [:hostname, :size, :region],
      defaults: {public_ip: true, template: "ubuntu-14.04", initial_user: "civo"}
    put :tags, "/v2/instances/:id/tags"
    put :update, "/v2/instances/:id"
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/:id", requires: [:id], send_delete_body: true
    post :reboot, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/:id/reboots", requires: [:id]
    post :hard_reboot, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/:id/hard_reboots", requires: [:id]
    post :soft_reboot, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/:id/soft_reboots", requires: [:id]
    get :console, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/:id/console", requires: [:id]
    put :rebuild, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/:id/rebuild", requires: [:id]
    put :stop, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/:id/stop", requires: [:id]
    put :start, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/:id/start", requires: [:id]
    put :upgrade, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/:id/resize", requires: [:size, :id]
    put :restore, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/:id/restore", requires: [:snapshot, :id]
    put :move_ip, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/:id/ip/:ip", requires: [:ip, :id]
    if ENV["CIVO_API_VERSION"] == "2"
      put :firewall, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/:id/firewall", requires: [:firewall_id, :id]
    else
      put :firewall, "/v#{ENV["CIVO_API_VERSION"] || "1"}/instances/:id/firewall", requires: [:name, :id]
    end

    def nice_ip_addresses
      @ip_addresses ||= (self._attributes[:ip_addresses].items rescue []).map do |ip|
        if ip.public_ip
          "#{ip.private_ip}=>#{ip.public_ip}"
        else
          "#{ip.private_ip}"
        end
      end.join(", ")
    end

    def to_partial_path
      "civo/instance"
    end
  end
end
