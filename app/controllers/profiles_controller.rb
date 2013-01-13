class ProfilesController < ApplicationController
  include ProfilesHelper
  before_filter :authenticate_user!

  def show
    @similars = Array.new
    @user = User.find_by_profile_name(params[:id])
    raise ActiveRecord::RecordNotFound if @user.nil?

    @following = @user.friends
    @followers_length = (Friendship.where friend_id: @user.id).length
    @artists = Array.new
    Add.where(user_id: @user).each do |add|
      @artists << Artist.find_by_id(add.artist_id)
    end

    if @user != current_user and not current_user.friends.include?(@user)
      @follow = @user # we can follow the user
    elsif @user != current_user and current_user.friends.include?(@user)
      @unfollow = @user # we can unfollow the user
    elsif @artists.length > 0 # User with similar taste
      artists_samples = @artists.sample 10
      artists_samples.each do |sample| # 10 times max

        adds = Add.where(artist_id: sample.id).sample 100
        adds.each do |add|
          similar = User.find_by_id(add.user_id)
          if @user != similar and not @following.include?(similar)
            @similars << similar
          end
        end
        rep = repeated(@similars)
        if rep.length > 5
          @similars = rep.sample 5
        elsif rep.length < 1
            @similars = @similars.sample 5
        else
          @similars = rep
        end

      end
    end
   
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404', status: :not_found 
  end

  def followings
    @user = User.find_by_profile_name(params[:id])
    @following = @user.friends
    raise ActiveRecord::RecordNotFound if @user.nil?

  rescue ActiveRecord::RecordNotFound
    render file: 'public/404', status: :not_found 
  end

  def followers
    @user = User.find_by_profile_name(params[:id])
    @followers = Array.new
    friendships = Friendship.where friend_id: @user.id
    friendships.each do |friend|
      @followers << User.find_by_id(friend.user_id)
    end

    raise ActiveRecord::RecordNotFound if @user.nil?
  
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404', status: :not_found 
  end
end
