class Mood < ApplicationRecord
  has_many :mood_choices
  has_many :demands, through: :mood_choices
end
