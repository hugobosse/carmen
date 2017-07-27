class AddTagsToDemand < ActiveRecord::Migration[5.0]
  def change
    add_column :demands, :tags, :string
  end
end
