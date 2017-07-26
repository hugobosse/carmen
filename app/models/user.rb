class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
        # , :validatable
  has_many :demands
  phony_normalize :mobile_phone, default_country_code: 'FR'
  validates :mobile_phone, presence: true
  validates_plausible_phone :mobile_phone
  validates :mobile_phone, format: {
    with: /\A(\+33|0)\s*[6,7](\s*\d{2}){4}\z/,
    message: "Ce n'est pas un numéro de mobile valide"
  }
end
