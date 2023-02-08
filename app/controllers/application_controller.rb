class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery

  def authenticate_with_api_key!
    @user = authenticate_or_request_with_http_token(&method(:authenticator))
  end

  def authenticator(http_token, _options)
    current_api_key = ApiKey.find_by token: http_token
    current_api_key&.user
  end
end
