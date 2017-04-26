class DemandsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]

  def create
    @demand = Demand.new(demand_params)
    if @demand.save
      redirect_to root_path, notice: "Correct"
    else
      redirect_to root_path, notice: "Wrong"
    end
  end

  private

  def demand_params
    params.require(:demand).permit(:people, :date, :address, :budget, :phone, :name, cuisine_ids: [])
  end

end
