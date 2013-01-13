class FriendshipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    if params[:friend_id]
      @friend = User.find_by_id(params[:friend_id])
      @friendship = current_user.friendships.new(friend: @friend)

      @friendship.save
      render :text => params[:friend_id] and return if request.xhr?
      flash[:notice] = "You are now following #{@friend.name}"
      redirect_to profile_path(@friend.profile_name)
    else
      flash[:error] = "Friend is required"
      redirect_to root_path
    end
  end

  def destroy
    if params[:friend_id]
      @friend = User.find_by_id(params[:friend_id])
      @friendship = current_user.friendships.find_by_friend_id(@friend.id)

      @friendship.destroy
      render :text => params[:friend_id] and return if request.xhr?
      flash[:notice] = "You are not following #{@friend.name}"
      redirect_to profile_path(@friend.profile_name)
    else
      flash[:error] = "Friend is required"
      redirect_to root_path
    end
  end
end