module Civo
  class DnsDomain < Base
    get :all, "/v2/dns"
    post :create, "/v2/dns", required: [:name]
    put :update, "/v2/dns/:id"
    delete :remove, "/v2/dns/:id", required: [:id]

    def to_partial_path
      "civo/dns_domain"
    end
  end
end
