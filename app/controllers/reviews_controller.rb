class ReviewsController < ApplicationController

  before_filter :restrict_access
  #restrict access is a protected method defined in appliation controller. 
  #Boom! You ain't creating a review, Mr. Notloggedinguy. Nice try.
  before_filter :load_movie
  #replaced this  @new = Movie.find(params[:movie_id])

  def new
    #we're grabbing the correct movie by using params[:movie_id],
    #then assigning movie_id to our new @review (using build rather than new)
    @review = @movie.reviews.build
  end

  def create
    @review = @movie.reviews.build(review_params)
    @review.user_id = current_user.user_id

      if @review.save
        redirect_to @movie, notice: "Review created successfully"
      else
        render :new
      end
  end

  protected

  def load_movie
     @movie = Movie.find(params[:movie_id])
     #it is very common to load a parent resource from a nesting resource.
  end

  def review_params
    params.require(:review).permit(:text, :rating_out_of_ten)
  end
end
