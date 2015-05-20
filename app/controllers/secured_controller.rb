# secured_controller.rb
class SecuredController < ApplicationController
  before_action :authenticate

  private

  def authenticate
    redirect_to new_session_path unless session[:user_id]
  end
end
