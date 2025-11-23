class MoviesController < ApplicationController
    def index
    @movies = Movie.all 
    render template: "movies/index"
  end

  def show
    @movie = Movie.find(params[:id])
    render template: "movies/show"
  end

  def create
    @movie = Movie.new(
      title: params[:title],
      year: params[:year],
      plot: params[:plot]
    )
    if @movie.save
      render :show, status: :created
    else
      render json: { errors: @movie.errors}, status: :unprocessable_entity
    end
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(
      title: params[:title] || @movie.title,
      year: params[:year] || @movie.year,
      plot: params[:plot] || @movie.plot
    )

    if @movie.valid?
      render :show, status: 
    else
      render json: { errors: @movie.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    render json: { message: "Movie was deleted..."}
  end

end
