class Api::V1::ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  def autenticame
    acts_as_token_authentication_handler_for User
  end
end
