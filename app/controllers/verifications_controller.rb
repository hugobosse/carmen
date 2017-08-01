class VerificationsController < ApplicationController
  def new
    @user = current_user
    @code = ''
  end

  def create
    input_code = params['/verify']['code']
    if input_code == current_user.verification_code
      current_user.mark_phone_as_verified!
      redirect_to root_path, notice: "Merci, votre numéro de mobile a été vérifié"
    else
      flash.now[:alert] = "Saisie incorrecte, merci de rentrer à nouveau votre code de vérification"
      render :new
    end
  end
end
