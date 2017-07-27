class DemandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def new
    @demand = Demand.new
  end

  def create
    @demand = Demand.new(demand_params)
    # DEBUG
    @demand.user = User.first
    @demand.status = Status.find_by_name('pending')
    # /DEBUG
    # raise
    if @demand.save
      @restaurants = Restaurant.near(
        params[:demand][:location],
        10
      ).where(
        mood_id: params[:demand][:mood_id].to_i
      ).where(
        budget_id: params[:demand][:budget_id].to_i
      )
      AdministratorMailer.send_new_demand(@demand, @restaurants).deliver_now
      redirect_to root_path, notice: "C'est noté, je vais chercher le restaurant qu'il vous faut ! Vous recevrez rapidement un message au ... avec les détails de votre réservation. Au cas ou, voici mon numéro 06 66 85 87 90"
    else
      render "pages/home"
    end
  end

  private

  def demand_params
    params.require(:demand).permit(
      :user_id,
      :number_of_people,
      :comment,
      :location,
      :scheduled_at,
      :budget_id,
      :mood_id,
      :status_id
    )
  end
end
