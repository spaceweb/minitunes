class ArtistController < ApplicationController

  def show
    @artist = Artist.find_by_name(params[:path])
    if not @artist
      @artist = Artist.new
      flash[:notice] = "You search \"#{params[:path]}\" did not match anything on MiniTunes"
    end
  end

end


