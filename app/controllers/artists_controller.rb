class ArtistsController < ApplicationController

  def show
    @albums = Array.new
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

  def create
    artist_name = params[:search].split.collect!{|word| word.capitalize}.join(' ')
    @artist = Artist.find_by_name(artist_name)
    if @artist
      redirect_to artist_path(@artist.name)
    else
      @artist_search = Artist.find_in_lastfm(params[:search])
      artist = {:name => @artist_search["name"], :description => @artist_search["bio"]["summary"]}
      @artist = Artist.create!(artist)
      redirect_to artist_path(@artist.name)
    end
  end

  

end
