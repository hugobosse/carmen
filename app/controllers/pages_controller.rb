class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :concept ]

  def home
  end

  def about
  end

  def concept
  end
end
