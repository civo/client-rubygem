module Civo
  class Charge < Base
    get :for, "/v1/charges"
  end
end
