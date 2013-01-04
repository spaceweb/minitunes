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
      @artist_search = Artist.find_in_lastfm(@artist.name)
      @artist_image = @artist_search["image"][4]["content"]
      @reviews = @artist.reviews
      @num_reviews = @reviews.length
    else
      @artist = Artist.new
      flash[:notice] = "You search \"#{params[:name]}\" did not match anything on MiniTunes"
    end

  end

  def create
    artist_name = params[:search].split.collect!{|word| word.capitalize}.join(' ')
    @artist = Artist.find_by_name(artist_name) || Artist.find_by_name(artist_name.upcase)
    if @artist
      redirect_to artist_path(@artist.name)
    else
      @artist_search = Artist.find_in_lastfm(params[:search])

      artist = {:name => @artist_search["name"], :description => @artist_search["bio"]["summary"]}
      if artist[:description] != {}
        artist[:description] = artist[:description].split(/<a(.+)href=(.+)rel="nofollow">(.+)<\/a>/).join
        @artist = Artist.create!(artist)
        # Save similars artist on DB
        createSimilar(@artist, @artist_search["similar"]["artist"])
        redirect_to artist_path(@artist.name)
      else
        flash[:notice] = "You search \"#{params[:search]}\" did not match anything on MiniTunes"
        redirect_to root_path
      end
    end

    rescue Lastfm::ApiError => lastfm_error
      if lastfm_error.message =~ /The artist you supplied could not be found/   
        flash[:notice] = "You search \"#{params[:search]}\" did not match anything on MiniTunes"
      elsif lastfm_error.message =~ /Invalid API key - You must be granted a valid key by last.fm/
        flash[:warning] = 'Search not available.'
      else
        flash[:warning] = lastfm_error.message
      end
      redirect_to root_path
  end

  protected
  def createSimilar(artist, similars) 
    similars.each do |similar|
      if similar.has_key?("name")
        ArtistSimilar.create(artist_id: artist.id,
                  similar_name: similar["name"],
                  artist_name: artist.name)
      end
    end
  end
end
