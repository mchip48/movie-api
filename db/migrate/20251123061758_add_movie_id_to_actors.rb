class AddMovieIdToActors < ActiveRecord::Migration[7.2]
  def change
    add_column :actors, :movie_id, :integer
    add_index :actors, :movie_id
    add_foreign_key :actors, :movies, column: :movie_id
  end
end
