class ActorsController < ApplicationController

  def index
    @actors = Actor.all 
    render json: @actors
  end

  # def show

  # end

  # def create

  # end

  # def update

  # end

  # def destroy

  # end
end
