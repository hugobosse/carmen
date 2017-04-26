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
  has_many :cuisine_choices
  has_many :cuisines, through: :cuisine_choices  #validates :mood, presence: true
end
