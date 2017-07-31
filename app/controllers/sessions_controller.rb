class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    params[:user][:mobile_phone] = PhonyRails.normalize_number(
      params[:user][:mobile_phone], country_code: 'FR'
    )
    super
  end
end
