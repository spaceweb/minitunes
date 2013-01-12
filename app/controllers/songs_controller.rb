class SongsController < ApplicationController

  def show
    @link = params[:song]
    render :partial => 'player', :locals => {:link => @link} and return if request.xhr?
  end

end