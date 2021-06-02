class AddCoordinatesToWorkshops < ActiveRecord::Migration[6.0]
  def change
    add_column :workshops, :latitude, :float
    add_column :workshops, :longitude, :float
  end
end
