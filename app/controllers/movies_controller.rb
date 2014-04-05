class MoviesController < ApplicationController

  #skinny controllers, fat models

  def index
    @movies = Movie.all
    #   @movies = Movie.find_by title: params[:title]
      #search
      # @movies = Movie.order("movies.release_date DESC")

      #This is good practice to help us visualize how our data is stored. Here, we know that release_date is 
      #a column on the movies table.
      # @movies = Movie.order(release_date: :desc, title: :asc)
      #this syntax signals a key, value pair, and therefore a hash.
      # @movies.where(...).order(...).where(...)
      # @movies.with_director('Quinton').matching_title('Fiction')
       # @movies = Movie.ordered_by_release_date
   

    @movies = @movies.matching_title(params[:title]) if params[:title].present?
    @movies = @movies.with_director(params[:director]) if params[:director].present?
   

    if params[:runtime_in_minutes]
      query_params = params[:runtime_in_minutes].split(",")
      min = query_params[0].to_i
      max = query_params[1].to_i
      @movies = @movies.search_by_runtime(min, max)
    end
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