module Civo
  class SshKey < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/sshkeys"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/sshkeys", requires: [:name, :public_key]
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/sshkeys/:name", requires: [:name]

    def to_partial_path
      "civo/ssh_key"
    end
  end
end
