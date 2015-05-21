# dashboard_controller.rb
class DashboardController < SecuredController
  helper :dashboard
  def index
    @recently_happened = Message.includes(:owner).where(owner_id: @current_user.following_ids << @current_user.id).order('created_at desc')
  end
end
