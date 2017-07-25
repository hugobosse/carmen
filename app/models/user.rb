class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
        # , :validatable

  phony_normalize :mobile_phone, default_country_code: 'FR'
  validates :mobile_phone, presence: true
  validates_plausible_phone :mobile_phone
end
