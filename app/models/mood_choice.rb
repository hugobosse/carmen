class MoodChoice < ApplicationRecord
  belongs_to :mood
  belongs_to :demand
end
