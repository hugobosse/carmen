class Restaurant < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :user
  belongs_to :budget
  belongs_to :mood
  has_many :taggings
  has_many :tags, through: :taggings

  validates :lunch_service_opening_at, format: { with: /(\A[0-2]\d:[0-5]\d\z|\A\s*\z)/ }
  validates :lunch_service_closing_at, format: { with: /(\A[0-2]\d:[0-5]\d\z|\A\s*\z)/ }
  validates :dinner_service_opening_at, format: { with: /(\A[0-2]\d:[0-5]\d\z|\A\s*\z)/ }
  validates :dinner_service_closing_at, format: { with: /(\A[0-2]\d:[0-5]\d\z|\A\s*\z)/ }

  phony_normalize :primary_phone, default_country_code: 'FR'
  validates :primary_phone, presence: true
  validates_plausible_phone :primary_phone
  validates :primary_phone, format: {
    with: /\A(\+33|0)\s*\d(\s*\d{2}){4}\z/,
    message: "Ce n'est pas un numéro de mobile valide"
  }

  validate :check_lunch_hours
  validate :check_dinner_hours

  def check_lunch_hours
    if lunch_service_opening_at and lunch_service_closing_at.nil?
      errors.add(:base, "lunch_service_closing_at is required")
    end
    if lunch_service_closing_at and lunch_service_opening_at.nil?
      errors.add(:base, "lunch_service_opening_at is required")
    end
  end

  def check_dinner_hours
    if dinner_service_opening_at and dinner_service_closing_at.nil?
      errors.add(:base, "dinner_service_closing_at is required")
    end
    if dinner_service_closing_at and dinner_service_opening_at.nil?
      errors.add(:base, "dinner_service_opening_at is required")
    end
  end
end
