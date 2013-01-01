class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find_by_profile_name(params[:id])
    raise ActiveRecord::RecordNotFound if @user.nil?

    if @user != current_user && !@user.friends.include?(current_user)
      @friend = @user
    end

    @friends = @user.friends

    @artists = Artist.where(id: @user.adds)
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404', status: :not_found 
  end
end
