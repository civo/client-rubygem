module Civo
  class AuditLog < Base
    get :global, "/v#{ENV["CIVO_API_VERSION"] || "1"}/auditlogs"
    get :instance, "/v#{ENV["CIVO_API_VERSION"] || "1"}/auditlogs/:id"
  end
end
