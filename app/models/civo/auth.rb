module Civo
  class Auth < Base
    post :exchange, "/v#{ENV["CIVO_API_VERSION"] || "2"}/auth/exchange"

    def to_partial_path
      "civo/auth"
    end
  end
end