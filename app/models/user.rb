class User < ApplicationRecord

  include Randomable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
        #  , :validatable

  before_save :set_phone_attributes, if: :phone_verification_needed?
  after_save :send_sms_for_phone_verification, if: :phone_verification_needed?

  has_many :demands
  
  validates_uniqueness_of :mobile_phone
  phony_normalize :mobile_phone, default_country_code: 'FR'
  validates :mobile_phone, presence: true
  validates_plausible_phone :mobile_phone, country_code: 'FR'
  validates :mobile_phone, format: {
    with: /\A(\+33|0)\s*[6,7](\s*\d{2}){4}\z/,
    message: "Ce n'est pas un numéro de mobile valide"
  }

  def mark_phone_as_verified!
    update!(verified: true, verification_code: nil)
  end

  private

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def set_phone_attributes
    self.verified = false
    self.verification_code = generate_verification_code
  end

  def generate_verification_code
    rand(1_000..9_999).to_s
  end

  def phone_verification_needed?
    mobile_phone.present? && mobile_phone_changed?
  end

  def send_sms_for_phone_verification
    to = mobile_phone
    code = verification_code
    body = "Votre code de vérification est : #{code}"
    Rails.logger.info "SMS: To: #{to} Body: #{body}"
    callr_api = CALLR::Api.new(ENV['CALLR_USERNAME'], ENV['CALLR_PASSWORD'])
    callr_api.call('sms.send', 'Carmen', to, body, nil)
  end
end
