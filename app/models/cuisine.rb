class Cuisine < ApplicationRecord
  has_many :cuisine_choices
  has_many :demands, through: :cuisine_choices
end
