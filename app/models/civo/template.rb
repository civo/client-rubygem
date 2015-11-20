module Civo
  class Template < Base
    get :all, "/v1/templates"
  end
end
