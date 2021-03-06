# secured_controller.rb
# this controller can be inherited by any controller that needs an authenticated user
class SecuredController < ApplicationController
  before_action :authenticate_user

  private

  def authenticate_user
    redirect_to new_session_path unless current_user
  end
end
