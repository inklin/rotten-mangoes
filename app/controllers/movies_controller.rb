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
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :director, :runtime_in_minutes, :description, :poster_image_url, :release_date
    )
  end
end
