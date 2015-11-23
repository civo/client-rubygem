module Civo
  class Size < Base
    get :all, "/v1/sizes"
    put :reset, "/v1/sizes"
  end
end
