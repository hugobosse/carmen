class DemandsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]

  def create
    @demand = Demand.new(demand_params)
    @demand.save
    if @demand.save
      redirect_to root_path, notice: "Correct"
    else
      redirect_to root_path, notice: "Wrong"
    end
  end

  private

  def demand_params
    params.require(:demand).permit(:people, :date, :address)
  end

end
