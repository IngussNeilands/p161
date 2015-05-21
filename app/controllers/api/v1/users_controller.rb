module Api
  module V1
    # users_controller.rb
    class UsersController < Api::V1::BaseController
      def messages
        @messages = User.find(params[:id]).messages.select(:id, :owner_id, :body, :created_at)
        render json: @messages
      end

      def followers
        @followers = User.find(params[:id]).followers.select(:id, :username, :email)
        render json: @followers
      end

      def following
        @follwing = User.find(params[:id]).followings.select(:id, :username, :email)
        render json: @follwing
      end
    end
  end
end
