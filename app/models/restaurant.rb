class Restaurant < ApplicationRecord
  belongs_to :user
  belongs_to :budget
  belongs_to :mood
end
