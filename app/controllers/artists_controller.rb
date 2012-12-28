class ArtistsController < ApplicationController

  def show
    @artist = Artist.find_by_id(params[:id])
    if not @artist
      @artist = Artist.new
      flash[:notice] = "You search \"#{params[:id]}\" did not match anything on MiniTunes"
    end
  end
  
  def create
    #Si se encuentra en la base de datos
    @artist = Artist.find_by_name(params[:name])
    #si no se encuentra, se crea ---> debería encontrarse, pero nose como va
    if not @artist
      @artist = Artist.create!(:name => params[:name], :description => params[:description], :similar => params[:similar])
    end
    relation = @artist.adds.build
    #User tiene que estar en session MODIFICAR
    user = User.find_by_name('Charlie Brown')
    user.adds << relation
    #Porque no salen los flash
    flash[:notice] == "#{@artist.name} was successfully added in your collection!"
    #
    redirect_to "/artists/#{@artist.id}"
  end

end


