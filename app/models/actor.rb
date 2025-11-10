class Actor < ApplicationRecord

  def create
    actor = Actor.new(
      first_name: params[:first_name]
    )
  end
end
