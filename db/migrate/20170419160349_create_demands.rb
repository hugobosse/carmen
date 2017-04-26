class CreateDemands < ActiveRecord::Migration[5.0]
  def change
    create_table :demands do |t|
      t.integer :people
      t.string :address
      t.datetime :date
      t.string :budget
      t.string :phone
      t.string :name

      t.timestamps
    end
  end
end
