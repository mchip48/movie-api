class RemoveGenderFromActors < ActiveRecord::Migration[7.2]
  def change
    remove_column :actors, :gender, :string
  end
end
