class Reservation < ApplicationRecord
  belongs_to :ping
  belongs_to :status
end
