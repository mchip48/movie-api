class ActorsController < ApplicationController

  def index
    @actors = Actor.all 
    render json: @actors
  end

  def show
    @actor = Actor.find(params[:id])
    render json: @actor
  end

  def create
    @actor = Actor.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      known_for: params[:known_for],
      movie_id: params[:movie_id]
    )
    if @actor.save
      render json: @actor, status: :created
    else
      render json: { errors: @actor.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @actor = Actor.find(params[:id])
    @actor.update(
      first_name: params[:first_name] || @actor.first_name,
      last_name: params[:last_name] || @actor.last_name,
      known_for: params[:known_for] || @actor.known_for,
      movie_id: params[:movie_id] || @actor.movie_id
    )

    if @actor.valid?
      render json: @actor
    else
      render json: { errors: @actor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy

    render json: { message: "Actor was deleted..."}
  end
  
end
