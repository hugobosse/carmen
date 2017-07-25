class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :primary_phone
      t.string :secondary_phone
      t.text :description
      t.stime :lunch_service_opening_at
      t.time :lunch_service_closing_at
      t.time :dinner_service_opening_at
      t.time :dinner_service_closing_at
      t.references :budget, foreign_key: true
      t.references :mood, foreign_key: true

      t.timestamps
    end
  end
end
