class AddCoordinatesToHabitats < ActiveRecord::Migration[7.2]
  def change
    add_column :habitats, :latitude, :float
    add_column :habitats, :longitude, :float
  end
end
