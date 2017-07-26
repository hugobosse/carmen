class Tag < ApplicationRecord
  include Randomable

  has_many :taggings
  has_many :restaurants, through: :taggings

  validates :name, presence: true
end
