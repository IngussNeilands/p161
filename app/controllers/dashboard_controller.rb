class DashboardController < SecuredController
  def index
    @recently_happened = Message.order('created_at desc')
  end
end
