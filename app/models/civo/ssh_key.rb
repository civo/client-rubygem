module Civo
  class SshKey < Base
    get :all, "/v1/sshkeys"
    post :create, "/v1/sshkeys"
    delete :remove, "/v1/sshkeys/:name"
  end
end
