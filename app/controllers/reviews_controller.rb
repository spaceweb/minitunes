class ReviewsController < ApplicationController

  def create
    if signed_in?
      @artist = Artist.find_by_name(params[:name])
      @review = @artist.reviews.build(params[:review])
      current_user.reviews << @review
      @review.save!
      @reviews = @artist.reviews
      render :partial => 'artists/show_reviews', :object => @reviews and return if request.xhr?
      flash[:notice] = 'Review successfully created.'
      redirect_to artist_path
    else
      redirect_to login_path
    end
  end

end