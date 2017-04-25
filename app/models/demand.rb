class Demand < ApplicationRecord
  validates :people, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :date, presence: true
  validates :budget, presence: true
  validates :phone, presence: true
  #validates_format_of :phone, with: /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/, message: "Veuillez insérer un numéro de tel valide"
  validates :name, presence: true
  has_and_belongs_to_many :cuisines
  #validates :mood, presence: true
end
