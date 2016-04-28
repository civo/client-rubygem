module Civo
  class AuditLog < Base
    get :global, "/v1/auditlogs"
    get :instance, "/v1/auditlogs/:id"
  end
end
