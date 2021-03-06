# users_controller.rb
class UsersController < SecuredController
  before_action :authenticate_user, except: [:new, :create]
  before_action :set_user, only: [:show, :follow, :unfollow]
  before_action :set_current_user, only: [:edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.includes(:messages).all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def follow
    respond_to do |format|
      if @current_user.relationships.create(followed_id: params[:id])
        format.js
      else
        format.js
      end
    end
  end

  def unfollow
    @relationship = @current_user.relationships.find_by_followed_id(params[:id])
    puts @relationship.inspect
    @relationship.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.includes(:messages).find(params[:id])
  end

  def set_current_user
    @user = @current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
