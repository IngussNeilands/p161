# dashboard_helper.rb
module DashboardHelper
  def display_username(user)
    user == @current_user ? 'You' : user.username
  end

  def follow_or_unfollow_user(user)
    if @current_user.followings.include?(user)
      unfollow_user(user)
    else
      follow_user(user)
    end
  end

  def follow_user(user)
    link_to 'Follow', follow_user_path(user), method: :post, remote: true, class: @current_user.id.to_s + '_' + user.id.to_s
  end

  def unfollow_user(user)
    link_to 'Unfollow', unfollow_user_path(user), method: :post, remote: true, class: @current_user.id.to_s + '_' + user.id.to_s
  end
end
