module Civo
  class Webhook < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "1"}/webhooks"
    put :save, "/v#{ENV["CIVO_API_VERSION"] || "1"}/webhooks/:id"
    post :test, "/v#{ENV["CIVO_API_VERSION"] || "1"}/webhooks/:id/test"
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "1"}/webhooks", required: [:name, :url]
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "1"}/webhooks/:id", send_delete_body: true
  end

  def to_partial_path
    "civo/webhook"
  end
end
