class FriendshipController < ApplicationController
  def create
   @friendship = Friendship.new(user_id: params[:user_id], friend_id: current_user.id)

    if @friendship.save
      redirect_to user_path(params[:user_id]), notice: 'Friend Request Successfully Sent'
    else
      redirect_to user_path(params[:user_id]), alert: 'Friend Request Not Sent'
    end 
  end
  
end
