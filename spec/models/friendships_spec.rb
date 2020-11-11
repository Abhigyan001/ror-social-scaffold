require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before(:each) do
    @userA = User.create(name: 'apple', email: 'usera@examp.com', password: 'password')
    @userB = User.create(name: 'banana', email: 'userb@examp.com', password: 'password')
    @userC = User.create(name: 'cashew', email: 'userc@examp.com', password: 'password')
    @iv1 = Friendship.create(user_id: @userB.id, friend_id: @userA.id)
    @iv2 = Friendship.create(user_id: @userC.id, friend_id: @userA.id)
    @iv3 = Friendship.create(user_id: @userB.id, friend_id: @userC.id)
  end

  context 'Checking User to User connections' do
    it "return 2 inverse_friendships for 'userA'" do
      expect(@userA.inverse_friendships.count).to eq(2)
    end

    it 'returns userB as the first in the inverse_friendship' do
      expect(@userA.inverse_friendships.first.user).to eq(@userB)
    end

    it 'returns the 2 friendships for @userB' do
      expect(@userB.friendships.count).to eq(2)
    end

    it 'returns the userA as the first in userB frienship list' do
      expect(@userB.friendships.first.friend).to eq(@userA)
    end

    it 'returns a list of @userB and @userC in @userA friend_requests list' do
      expect(@userA.friend_requests).to eq([@userB, @userC])
    end

    it 'returns a list of @userA and @userC in @userB pending_friends list' do
      expect(@userB.pending_friends).to eq([@userA, @userC])
    end
  end
end
