module Civo
  class DnsRecord < Base
    get :all, "/v2/dns/:domain_id/records"
    post :create, "/v2/dns/:domain_id/records", required: [:name, :value, :type]
    put :update, "/v2/dns/:domain_id/records/:id", required: [:name, :value, :type]
    delete :remove, "/v2/dns/:domain_id/records/:id", required: [:id]

    def to_partial_path
      "civo/dns_domain"
    end
  end

  class DNSRecord < DnsRecord ; end
end
