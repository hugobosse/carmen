class User < ApplicationRecord

  include Randomable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :demands

  validates_presence_of :email, if: :email_required?
  # validates_uniqueness_of :email, allow_blank: true

  validates_uniqueness_of :mobile_phone
  phony_normalize :mobile_phone, default_country_code: 'FR'
  validates :mobile_phone, presence: true
  validates_plausible_phone :mobile_phone, country_code: 'FR'
  validates :mobile_phone, format: {
    with: /\A(\+33|0)\s*[6,7](\s*\d{2}){4}\z/,
    message: "Ce n'est pas un numéro de mobile valide"
  }

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
