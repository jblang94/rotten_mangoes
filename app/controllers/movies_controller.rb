class MoviesController < ApplicationController
  def index
    @movies = Movie.search(params[:search], params[:runtime_filter])
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      flash[:success] = "#{@movie.title} was submitted successfully!"
      redirect_to movies_path
    else
      render :new
    end

  end

  def update
    @movie = Movie.find(params[:id])

    @movie.remove_poster! if params[:remove_poster]

    if @movie.update_attributes(movie_params)
      flash[:success] = "#{@movie.title} was updated successfully!"
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:success] = "#{@movie.title} was deleted!"
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster, :description, :remove_poster, :remote_poster_url)
  end

end