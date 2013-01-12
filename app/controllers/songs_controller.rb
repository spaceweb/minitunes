class SongsController < ApplicationController

  def show
    @artist = params[:name]
    @song = params[:title]
    @link = params[:song]
    render :partial => 'player', :locals => {:link => @link} and return if request.xhr?
  end

end