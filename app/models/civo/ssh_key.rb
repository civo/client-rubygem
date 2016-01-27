module Civo
  class SshKey < Base
    get :all, "/v1/sshkeys"
    post :create, "/v1/sshkeys", requires: [:name, :public_key]
    delete :remove, "/v1/sshkeys/:name", requires: [:name]
  end
end
