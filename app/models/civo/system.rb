module Civo
  class System < Base
    get :ping, "/ping"
  end
end
