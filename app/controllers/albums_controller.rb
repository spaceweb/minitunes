class AlbumsController < ApplicationController

  def show
    @songs = Array.new
    @artist = Artist.find_by_name(params[:name])
    name_album = params[:title].gsub('##$','.').gsub('##@','/')
    @album = Album.find_by_name(name_album)
    @songs_search = Album.find_songs_in_lastfm(@artist.name.gsub('##$','.').gsub('##@','/'), @album.name)
    @album_image = @songs_search["image"][4]["content"]
    contains = Contain.find_all_by_album_id(@album.id)
    contains.each do |contain|
      @songs << Song.find_by_id(contain.song_id)
    end
  end

  def create
    @artist = Artist.find_by_name(params[:name])
    name_album = params[:title].gsub('##$','.').gsub('##@','/')
    @album = Album.find_by_name(name_album)
    if not @album.tracks
      a = Album.find_album_in_lastfm(params[:name].gsub('##$','.').gsub('##@','/'), name_album)
      updateAlbum(a, @album) if a
    end
    if @album.contains.empty?
      @songs_search = Album.find_songs_in_lastfm(@artist.name.gsub('##$','.').gsub('##@','/'), @album.name)
      createSongs(@songs_search, @artist) if @songs_search
    end
    redirect_to album_path(@artist.name, params[:title])
  end
  
  protected
  def updateAlbum(result_search, album)
    tracks = result_search["tracks"]["track"]
    if not tracks.kind_of?(Array)
      @tracks = Array.new
      @tracks << tracks
    else
      @tracks = tracks
    end
    album.tracks = @tracks.length
    if result_search["releasedate"].empty?
      result_search["releasedate"] = ""
    end
    album.release_date = result_search["releasedate"]
    album.save!
  end
  
  def createSongs(songs_search, artist)
    songs_search = songs_search["tracks"]["track"]
    if not songs_search.kind_of?(Array)
      @songs = Array.new
      @songs << songs_search
    else
      @songs = songs_search
    end
    @songs.each do |s|
      link = Album.find_in_youtube(artist.name.gsub('##$','.').gsub('##@','/'), s["name"])    
      song = Song.create!(:name => s["name"], :track => s["rank"].to_i, :duration => s["duration"], :link => link)
      c = song.contains.build
      @album.contains << c
    end
  end

end
