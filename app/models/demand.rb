class Demand < ApplicationRecord
  validates :people, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :date, presence: true
  validates :budget, presence: true
  validates :phone, presence: true
  #validates :name, presence: true
  #validates :cuisine, presence: true
  #validates :mood, presence: true
end
