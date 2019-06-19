module Civo
  class AuditLog < Base
    get :global, "/v#{ENV["CIVO_API_VERSION"] || "2"}/auditlogs"
    get :instance, "/v#{ENV["CIVO_API_VERSION"] || "2"}/auditlogs/:id"

    def to_partial_path
      "civo/audit_log"
    end
  end
end
