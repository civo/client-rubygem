module Civo
  class Base < ::Flexirest::Base
    before_request :authorization_token
    before_request :administration_set_user

    private

    def authorization_token(name, request)
      request.headers["Authorization"] = "bearer #{ENV["CIVO_TOKEN"]}"
    end

    def administration_set_user(name, request)
      unless ENV["CIVO_API_VERSION"].to_s == "2"
        Rails.logger.debug("Not using v2, using #{ENV["CIVO_API_VERSION"]}")
        return
      end

      user_id = request.post_params[:user_id] # Don't delete the param in case it's needed by an action
      if user_id.present?
        request.headers["X-Civo-UserID"] = user_id
      end
      account_id = request.post_params[:account_id] # Don't delete the param in case it's needed by an action
      if account_id.present?
        request.headers["X-Civo-AccountID"] = account_id
      end
    end

  end
end

Flexirest::Base.base_url = ENV["CIVO_URL"]
