class ArtistsController < ApplicationController

  def show
    @artist = Artist.find_by_id(params[:id])
    if not @artist
      @artist = Artist.new
      flash[:notice] = "You search \"#{params[:id]}\" did not match anything on MiniTunes"
    end
  end

end


