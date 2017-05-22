class CreateDemands < ActiveRecord::Migration[5.0]
  def change
    create_table :demands do |t|
      t.integer :people
      t.string :address
      t.datetime :date
      t.string :budget
      t.string :phone
      t.string :name
      t.string :mood
      t.string :visitor_input
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
