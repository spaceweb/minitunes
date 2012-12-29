class ProfilesController < ApplicationController
  def show
  	if current_user
	    @user = User.find_by_profile_name(params[:id])
	    @artists = Artist.all
	else
		redirect_to :login
	end
  end
end
