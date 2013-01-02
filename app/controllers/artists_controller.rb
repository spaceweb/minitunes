class ArtistsController < ApplicationController

  def show
    @albums = []
    @artist = Artist.find_by_name(params[:name])
    participates = Participate.find_all_by_artist_id(@artist.id)
    participates.each do |participate|
      @albums << Album.find_by_id(participate.album_id)
    end
      
    if @artist
      if signed_in?
        relations = Add.find_all_by_user_id(current_user.id)
        relations.each do |relation|
          if Artist.find_by_id(relation.artist_id).name == params[:name]
            @add = true
          end
        end
      end
      @reviews = @artist.reviews
      @num_reviews = @reviews.length
    else
      @artist = Artist.new
      flash[:notice] = "You search \"#{params[:name]}\" did not match anything on MiniTunes"
    end
  
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
