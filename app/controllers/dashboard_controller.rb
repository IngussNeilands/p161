class DashboardController < SecuredController
  def index
    @user = User.includes(:messages,:following, :activities).find(session[:user_id])
    @message = @user.messages.new
  end
end
