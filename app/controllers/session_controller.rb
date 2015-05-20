class SessionController < ApplicationController

  def new
    redirect_to root_path if session[:user_id]
  end

  def create
    @user = User.find_by_username(params[:login][:username])
    respond_to do |format|
      if @user.present? && set_current_user
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
    session[:user_id] = @user.id
    true
  end

  def clear_current_user
    session[:user_id] = nil
    true
  end
end
