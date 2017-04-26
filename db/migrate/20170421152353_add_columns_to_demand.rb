class AddColumnsToDemand < ActiveRecord::Migration[5.0]
  def change
    add_column :demands, :latitude, :float
    add_column :demands, :longitude, :float
  end
end
