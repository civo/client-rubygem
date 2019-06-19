module Civo
  class SshKey < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/sshkeys"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/sshkeys", requires: [:name, :public_key]
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/sshkeys/:id", requires: [:id], send_delete_body: true
    put :update, "/v#{ENV["CIVO_API_VERSION"] || "2"}/sshkeys/:id", requires: [:id, :name]

    def to_partial_path
      "civo/ssh_key"
    end
  end
end
