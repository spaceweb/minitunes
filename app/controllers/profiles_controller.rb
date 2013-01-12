class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @similars = Array.new
    @user = User.find_by_profile_name(params[:id])
    raise ActiveRecord::RecordNotFound if @user.nil?

    @following = @user.friends
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

        adds = Add.where(artist_id: sample.id).sample 10
        adds.each do |add|
          similar = User.find_by_id(add.user_id)
          if @user != similar and not @following.include?(similar)
            @similars << similar
          end
        end
        @similars.uniq! # Make sure there are not repeated users
        @similars = @similars.sample(10) # Only show 10 users

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
    @followers = Friendship.where friend_id: "@user.id"
    raise ActiveRecord::RecordNotFound if @user.nil?
  
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404', status: :not_found 
  end
end
