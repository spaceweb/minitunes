class FriendshipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    if params[:friend_id]
      @friend = User.find_by_id(params[:friend_id])
      @friendship = current_user.friendships.new(friend: @friend)

      @friendship.save
      flash[:notice] = "You are now friends with #{@friend.name}"
      redirect_to profile_path(@friend.profile_name)
    else
      flash[:error] = "Friend is required"
      redirect_to root_path
    end
  end
end