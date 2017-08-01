class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i(home about)

  def home
    @demand = Demand.new
  end

  def about; end
end
