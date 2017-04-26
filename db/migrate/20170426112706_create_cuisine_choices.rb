class CreateCuisineChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :cuisine_choices do |t|
      t.references :cuisine, foreign_key: true
      t.references :demand, foreign_key: true

      t.timestamps
    end
  end
end
