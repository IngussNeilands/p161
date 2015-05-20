# sessions_controller.rb
class SessionsController < SecuredController
  before_action :authenticate_user, only: [:destroy]

  def new
    redirect_to root_path if @current_user
  end

  def create
    @user = User.find_by_username_and_password(params[:login][:username], params[:login][:password])
    respond_to do |format|
      if set_current_user
        format.html { redirect_to root_path, notice: 'Successful login.' }
      else
        format.html { render :new, notice: 'Something went wrong...' }
      end
    end
  end

  def destroy
    clear_current_user
    redirect_to new_session_path, notice: 'Good bye!'
  end

  private

  def set_current_user
    session[:user_id] = @user.id if @user.present?
  end

  def clear_current_user
    session[:user_id] = nil
    true
  end
end
