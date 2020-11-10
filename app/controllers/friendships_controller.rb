class FriendshipsController < ApplicationController

    def create
        @friend_request = Friendship.new(user_id: params[:user_id], friend_id: current_user.id)
        if @friend_request.save
            redirect_to users_path, notice: 'Friend Request sent!.'
        else
            redirect_to users_path, notice: 'Friend Request not sent!.'
        end
    end
end
