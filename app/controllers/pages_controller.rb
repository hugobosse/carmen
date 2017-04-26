class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about]

  def home
    @demand = Demand.new(params)
    @cuisines = Cuisine.all
  end

  def about
  end

end
