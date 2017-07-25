class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :ping, foreign_key: true
      t.references :status, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
