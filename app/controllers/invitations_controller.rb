class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friend_requests = current_user.friend_requests
  end

  def create
    @friend_request = Friendship.where(user_id: params[:user_id], friend_id: current_user.id).first
    if @friend_request
      current_user.confirm_friend(@friend_request.user)
      Friendship.create(user_id: current_user.id, friend_id: params[:user_id], confirmed: true)
      redirect_to invitations_path, notice: 'Request Approved.'
    else
      redirect_to invitations_path, notice: 'Request denied.'
    end
  end

  def destroy
    @friend_request = current_user.inverse_friendships.where(user_id: params[:user_id]).first
    if @friend_request
      @friend_request.destroy
      redirect_to invitations_path, notice: 'Request Rejected.'
    else
      redirect_to invitations_path, notice: 'Cannot perform Request Rejection action'
    end
  end
end
