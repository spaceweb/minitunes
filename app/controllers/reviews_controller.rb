class ReviewsController < ApplicationController

  def create
    if params[:commit] == "Cancel"
      redirect_to artist_path
    else
      if signed_in?
        @artist = Artist.find_by_name(params[:name])
        @review = @artist.reviews.build(params[:review])
        current_user.reviews << @review
        @review.save!
        flash[:notice] = 'Review successfully created.'
        redirect_to artist_path
      else
        redirect_to login_path
      end
    end
  end

end