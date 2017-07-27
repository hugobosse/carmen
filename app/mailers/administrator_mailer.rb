class AdministratorMailer < ApplicationMailer
  def send_new_demand(demand, restaurants)
    @demand = demand
    @restaurants = restaurants
    mail(
      to: 'admin@carmen.fr', # TODO : ask Hugo for appropriate email
      subject: 'New carmen demand'
    )
  end
end
