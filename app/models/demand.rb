class Demand < ApplicationRecord
  belongs_to :user
  belongs_to :budget
  belongs_to :mood
  belongs_to :status
  has_many :pings
end
