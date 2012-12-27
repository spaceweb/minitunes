class ProfilesController < ApplicationController
  def show
    @user = User.find_by_profile_name(params[:id])
    @artists = Artist.all
  end
end
