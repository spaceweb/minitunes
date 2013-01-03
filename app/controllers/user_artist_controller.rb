class UserArtistController < ApplicationController
  before_filter :authenticate_user!

  def create
    @artist = Artist.find_by_id(params[:id])
    relation = @artist.adds.build
    current_user.adds << relation
    flash[:notice] = "#{@artist.name} was successfully added in your collection!"
    redirect_to artist_path(@artist.name)
  end
  
  
  def destroy
    @artist = Artist.find_by_id(params[:id])
    relation = Add.find_all_by_user_id(current_user.id) & Add.find_all_by_artist_id(@artist.id)
    #Esta en Array no me deja eliminar a no ser que haga un each
    relation.each do |r|
      r.destroy
    end
    flash[:notice] = "#{@artist.name} was successfully deleted"
    redirect_to artist_path(@artist.name)
  end
end