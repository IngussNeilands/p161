# relationships_controller.rb
class RelationshipsController < SecuredController
  def create
    user = User.find(params[:followed_id])
    User.find(session[:user_id]).follow(user)
    render :nothing => true
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    User.find(session[:user_id]).unfollow(user)
    render :nothing => true
  end
end
