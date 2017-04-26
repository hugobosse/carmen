class CreateMoodChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :mood_choices do |t|
      t.references :mood, foreign_key: true
      t.references :demand, foreign_key: true

      t.timestamps
    end
  end
end
