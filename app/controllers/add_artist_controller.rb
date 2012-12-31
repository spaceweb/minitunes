class AddArtistController < ApplicationController
  before_filter :authenticate_user!

  def create
    @artist = Artist.find_by_id(params[:id])
    relation = @artist.adds.build
    current_user.adds << relation
    flash[:notice] = "#{@artist.name} was successfully added in your collection!"
    redirect_to artist_path(@artist.name)
  end
end