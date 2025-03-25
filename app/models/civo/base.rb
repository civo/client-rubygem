module Civo
  class Base < ::Flexirest::Base
    verbose!
    before_request :authorization_token
    before_request :set_request_id
    before_request :administration_set_user
    before_request :set_reseller_id

    private

    def authorization_token(name, request)
      request.headers["Authorization"] = "bearer #{ENV["CIVO_TOKEN"]}"
    end

    def administration_set_user(name, request)
      unless ENV["CIVO_API_VERSION"].to_s == "2"
        Rails.logger.debug("Not using v2, using #{ENV["CIVO_API_VERSION"]}")
        return
      end

      user_id = (request.post_params[:user_id] || request.get_params[:user_id]) # Don't delete the param in case it's needed by an action
      if user_id.present?
        request.headers["X-Civo-UserID"] = user_id
      end
      account_id = (request.post_params[:account_id] || request.get_params[:account_id]) # Don't delete the param in case it's needed by an action
      if account_id.present?
        request.headers["X-Civo-AccountID"] = account_id
      end
    end

    def set_request_id(name, request)
      if const_defined?("Current") && Current.request_id
        request.headers["X-CivoCom-RequestID"] = Current.request_id
      end
    end

    def set_reseller_id(name, request)
      request.headers["X-Reseller-Id"] = "#{ENV["RESELLER_ID"] || ""}"
    end

  end
end

Flexirest::Base.base_url = ENV["CIVO_URL"]
