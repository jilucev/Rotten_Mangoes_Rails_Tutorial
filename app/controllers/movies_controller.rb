class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
      if @movie.save
        redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
      else
        render :new
      end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
      #links to movies#show(needs a parameter to figure out which movie by finding its id)
    else
      render :edit
    end
  end

  # <%= link_to movie.title, movie_path(movie) %> | <%= movie.review_average %>10</h2>

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
    #links to movies#index
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, 
      :runtime_in_minutes, :poster_image_url,
      :description, :poster
    )
  end
end