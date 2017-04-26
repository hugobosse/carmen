class CuisineChoice < ApplicationRecord
  belongs_to :cuisine
  belongs_to :demand
end
