class Ping < ApplicationRecord
  belongs_to :restaurant
  belongs_to :demand
  belongs_to :status
end
