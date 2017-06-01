class DemandsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]

  def create
    @demand = Demand.new(demand_params)
    if @demand.save
      redirect_to root_path, notice: "C'est noté, je vais reflechir pour trouver le restaurant qu'il vous faut ! Vous recevrez promptement un message au #{@demand.phone} avec les détails de votre réservation. Au cas ou, voici mon numéro 06 66 85 87 90"
    else
      render "pages/home"
    end
  end

  private

  def demand_params
    params.require(:demand).permit(:people, :date, :address, :budget, :phone, :mood, :visitor_input)
  end

end
