module Civo
  class Subnet < Base
    get :all, "/v2/networks/:network_id/subnets", requires: [:region]
    post :create, "/v2/networks/:network_id/subnets", requires: [:name, :region]
    delete :remove, "/v2/networks/:network_id/subnets/:id", requires: [:id, :region]

    def to_partial_path
      "civo/subnet"
    end
  end
end
