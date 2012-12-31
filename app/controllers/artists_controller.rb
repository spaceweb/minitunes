class ArtistsController < ApplicationController

  def show
    @artist = Artist.find_by_name(params[:name])
    if not @artist
      @artist = Artist.new
      flash[:notice] = "You search \"#{params[:name]}\" did not match anything on MiniTunes"
      if signed_in?
        redirect_to "/#{current_user.profile_name}"
      else
        redirect_to root_path
      end
    else
      @reviews = @artist.reviews
      @num_reviews = @reviews.length
    end
  end

end

