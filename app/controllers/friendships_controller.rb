class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friend_request = Friendship.new(user_id: current_user.id, friend_id: params[:user_id])
    if @friend_request.save
      redirect_to users_path, notice: 'Friend Request sent!'
    else
      redirect_to users_path, notice: 'Friend Request not sent!'
    end
  end

  def index; end
end
