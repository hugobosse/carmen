require 'faker'

Tagging.destroy_all
Tag.destroy_all
Restaurant.destroy_all
User.destroy_all
Reservation.destroy_all
Ping.destroy_all
Mood.destroy_all
Budget.destroy_all
Status.destroy_all
Demand.destroy_all

# ------------------------------------------------------------------------------
print 'Seeding moods..'
%w(business romantic party children outdoor).each do |mood|
  m = Mood.new(name: mood)
  puts m.errors.messages unless m.valid?
  m.save
end
puts 'done.'

#-------------------------------------------------------------------------------
tags = %w(vegan chinese italian japanese indian french spanish korean portuguese)
print 'Seeding tags..'
tags.each do |tag|
  t = Tag.new(name: tag)
  puts t.errors.messages unless t.valid?
  t.save
end
puts 'done.'

# ------------------------------------------------------------------------------
budgets = [
  '- de 10 €',
  '10 à 15 €',
  '15 à 20 €',
  '25 à 30 €',
  '+ de 30€'
]
print 'Seeding budgets..'
budgets.each do |budget|
  b = Budget.new(name: budget)
  puts b.errors.messages unless b.valid?
  b.save
end
puts 'done.'

# ------------------------------------------------------------------------------
print 'Seeding statuses..'
%w(pending accepted refused cancelled noshow).each do |status|
  s = Status.new(name: status)
  puts s.errors.messages unless s.valid?
  s.save
end
puts 'done.'

# ------------------------------------------------------------------------------
print 'Seeding users..'
50.times do
  u = User.new(
    mobile_phone: '0' + rand(600_000_000..799_999_999).to_s,
    email: Faker::Internet.email(('a'..'z').to_a.sample(rand(8..12)).join(''))
  )
  puts u.errors.messages unless u.valid?
  u.save
end
puts 'done.'

# ------------------------------------------------------------------------------
cities = [
  '33000 Bordeaux',
  '75001 Paris',
  '13001 Marseille',
  '31000 Toulouse',
  '69001 Lyon',
  '54000 Nancy',
  '57000 Strasbourg',
  '44000 Nantes',
  '59000 Lille',
  '21000 Brest',
  '34000 Montpellier'
]

streets = [
  'Rue Victor Hugo',
  'Rue de l\'Eglise',
  'Rue de la mairie',
  'Place de la mairie',
  'Place de l\'Eglise',
  'Grande rue',
  'Rue de la gare',
  'Rue des écoles',
  'Rue principale',
  'Rue du moulin',
  'Rue Pasteur',
  'Rue du stade',
  'Rue du château',
  'Rue de la fontaine',
  'Rue des jardins'
]
print 'Seeding restaurants..'
100.times do
  r = Restaurant.new(
    user: User.random,
    name: Faker::GameOfThrones.city,
    address: rand(1..100).to_s + ' ' + streets.sample + ' ' + cities.sample,
    primary_phone: '0' + rand(600_000_000..799_999_999).to_s,
    description: Faker::Lorem.sentence,
    lunch_service_opening_at: '12:00',
    lunch_service_closing_at: '15:00',
    dinner_service_opening_at: '19:00',
    dinner_service_closing_at: '23:00',
    budget: Budget.random,
    mood: Mood.random
  )
  puts r.errors.messages unless r.valid?
  r.save
end
puts 'done.'

#-------------------------------------------------------------------------------
print 'Seeding taggings..'
Restaurant.all.each do |restaurant|
  2.times do
    t = Tagging.new(
      restaurant: restaurant,
      tag: Tag.random
    )
    puts t.errors.messages unless t.valid?
    t.save
  end
end
puts 'done.'
