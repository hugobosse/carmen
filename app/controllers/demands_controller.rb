class DemandsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i(create)

  def new
    @demand = Demand.new
  end

  def create
    # check for mobile phone
    valid_phone = true
    phonytized_phone = PhonyRails.normalize_number(params[:demand][:phone])
    valid_phone = false unless phonytized_phone =~ /\A(\+33)?[6,7]\d{8}\z/
    if valid_phone
      # check for existing user ?
      user = User.find_by_mobile_phone(phonytized_phone)
      raise

      # if mobile phone is valid but user doesn't exist, send auth code
      @demand = Demand.new(demand_params)
      @demand.user = user
      @demand.status = Status.find_by_name('pending')
      @restaurants = Restaurant.near(
        params[:demand][:location],
        10
      ).where(
        budget_id: params[:demand][:budget_id].to_i
      )
      if @demand.save
        AdministratorMailer.send_new_demand(@demand, @restaurants).deliver_now
        redirect_to root_path, notice: "C'est noté, je vais chercher le restaurant qu'il vous faut ! Vous recevrez rapidement un message au ... avec les détails de votre réservation. Au cas ou, voici mon numéro 06 66 85 87 90"
      else
        render "pages/home"
      end
    else
      # phone number not valid, redirect to root
      @demand = Demand.new
      render "pages/home", notice:  "Numéro de mobile non valide"
    end
  end

  private

  def demand_params
    params.require(:demand).permit(
      :budget_id,
      :comment,
      :number_of_people,
      :location,
      :phone,
      :scheduled_at,
      :status_id,
      :user_id,
    )
  end
end
