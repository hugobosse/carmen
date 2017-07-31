class PhoneVerificationService
  attr_reader :user

  def initialize(args)
    @user = User.find(args[:user_id])
  end

  def process
    send_sms
  end

  private

  def to
    @user.mobile_phone
  end

  def body
    "Merci d'entrer ce code pour vérifier votre numéro de téléphone : #{@user.verification_code}"
  end

  def send_sms
    Rails.logger.info "SMS: From: #{from} To: #{to} Body: #{body}"
    callr_api = CALLR::Api.new(
      ENV['CALLR_USERNAME'],
      ENV['CALLR_PASSWORD']
    )
    callr_api.call(
      'sms.send',
      'SMS',
      to,
      body,
      nil
    )
  end
end
