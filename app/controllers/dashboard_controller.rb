class DashboardController < SecuredController
  def index
    @recently_happened = Message.includes(:owner).order('created_at desc')
  end
end
