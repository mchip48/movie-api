class AddAttributeToActors < ActiveRecord::Migration[7.2]
  def change
    add_column :actors, :gender, :string
  end
end
