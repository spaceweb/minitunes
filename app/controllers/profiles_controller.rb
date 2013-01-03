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

    if @user != current_user and not @following.include?(current_user)
      @follow = @user # we can follow the user
    elsif @artists.length > 0 # User with similar taste
      others = Add.where(artist_id: @artists.sample.id)
      others.each_with_index do |other, i|
        break if i == 10
        similar = User.find_by_id(other.user_id)
        if @user.id != other.user_id and not @following.include?(similar)
          @similars << similar
        end
      end
    end
   
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404', status: :not_found 
  end
end
