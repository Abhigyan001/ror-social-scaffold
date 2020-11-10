class AcceptInvitationController < ApplicationController
  before_action :authenticate_user!
  
  def create
    
  end

  def index
    @pending_friends = current_user.pending_friends    
  end
  
  def destroy
  
  end
end
