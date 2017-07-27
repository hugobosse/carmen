class CreateDemands < ActiveRecord::Migration[5.0]
  def change
    create_table :demands do |t|
      t.references :user, foreign_key: true
      t.integer :number_of_people
      t.text :comment
      t.string :location
      t.datetime :scheduled_at
      t.references :budget, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
