class Restaurant < ApplicationRecord
  belongs_to :user
  belongs_to :budget
  belongs_to :mood
  has_many :taggings
  has_many :tags, through: :taggings
end
