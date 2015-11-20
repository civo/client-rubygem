module Civo
  class Region < Base
    get :all, "/v1/regions"
  end
end
