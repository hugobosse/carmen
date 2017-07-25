class Tag < ApplicationRecord
  has_many :taggings
  has_many :restaurants, through: :taggings
end
