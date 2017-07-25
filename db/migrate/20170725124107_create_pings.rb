class CreatePings < ActiveRecord::Migration[5.0]
  def change
    create_table :pings do |t|
      t.references :restaurant, foreign_key: true
      t.references :demand, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
